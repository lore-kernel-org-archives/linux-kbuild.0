Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([78.24.191.182]:57259 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756639Ab3FLLUS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Jun 2013 07:20:18 -0400
Received: from localhost.localdomain ([127.0.0.1]:52207 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6824813Ab3FLLURFrwWt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jun 2013 13:20:17 +0200
Date: Wed, 12 Jun 2013 13:20:09 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: Kconfig: Set default value for the "Kernel code
 model"
Message-ID: <20130612112009.GA7422@linux-mips.org>
References: <1370944336-13703-1-git-send-email-markos.chandras@imgtec.com>
 <20130611154129.GD13126@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130611154129.GD13126@linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Here's a simplified test case:

< --------- bite here --------- >
choice
	prompt "choice 1"

config FOO1
	bool "foo 1"

config FOO2
	bool "foo 2"
endchoice

choice
	prompt "frob"

config BAR
	bool "bar"
	depends on FOO2

endchoice
< --------- bite here --------- >

Save this to a file, then run:

  scripts/kconfig/conf --randconfig /tmp/xxx && cat .config

There will be two possible variants for generated .config files:

< --------- Variant 1 --------- >
CONFIG_FOO1=y
# CONFIG_FOO2 is not set
< --------- Variant 2 --------- >
# CONFIG_FOO1 is not set
# CONFIG_FOO2 is not set
< --------- End       --------- >

The intended third outcome which would be
< --------- doesn't happen ---- >
# CONFIG_FOO1 is not set
CONFIG_FOO2=y
< --------- End --------------- >

never gets generated.

Pretty much any tempering with this test case will change the behaviour.
For example removing the "depends on FOO2" line will result in the
behaviour of either CONFIG_FOO1 or CONFIG_FOO2 being set to y but never
none or both.  Other minor changes might result in both symbols getting
set.

  Ralf
