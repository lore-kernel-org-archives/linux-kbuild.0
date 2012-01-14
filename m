Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50047 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932099Ab2ANU6g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jan 2012 15:58:36 -0500
Message-ID: <4F11EC7F.4060506@suse.cz>
Date: Sat, 14 Jan 2012 21:58:39 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Parsing kconfig files from scripts
References: <4F10AE71.1060804@redfish-solutions.com>
In-Reply-To: <4F10AE71.1060804@redfish-solutions.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: linux-kbuild@vger.kernel.org

On 13.1.2012 23:21, Philip Prindeville wrote:
> One of the tasks on my list is to build automation that detects what
> targets to build nightly after continuous integrations into SCM
> (including new platforms being added).
> 
> A way to do this is to find in the Kconfig tree all possible values
> of a given symbol, such as CONFIG_CMDLINE for instance (ok, not a
> great example).
> 
> I was wondering if there was a command-line utility one could invoke
> to query the parse tree and dump values from it.

There is not, but a patch adding such tool would be welcome.

Michal
