Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:59483 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756750Ab3ANQbo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Jan 2013 11:31:44 -0500
Message-ID: <50F43339.4040701@infradead.org>
Date: Mon, 14 Jan 2013 08:32:57 -0800
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: where is the build rule for kernel's subdirs?
References: <20130114043314.GA3968@debian.localdomain>
In-Reply-To: <20130114043314.GA3968@debian.localdomain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: horseriver <horserivers@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 01/13/13 20:33, horseriver wrote:
> hi:
> 
>    How does   kbuild   build objects for subdirs of kernel source ? 

It goes into subdirs recursively.


From top-level Makefile:

# Objects we will link into vmlinux / subdirs we need to visit
init-y		:= init/
drivers-y	:= drivers/ sound/ firmware/
net-y		:= net/
libs-y		:= lib/
core-y		:= usr/


Then each subdir's Makefile has its own rules.

-- 
~Randy
