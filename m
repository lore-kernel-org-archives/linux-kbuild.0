Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:56370 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751966AbYBJScw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 13:32:52 -0500
Date: Sun, 10 Feb 2008 10:30:26 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: kconfig creates strange (invalid?) configuration
Message-Id: <20080210103026.27e639d3.randy.dunlap@oracle.com>
In-Reply-To: <20080210143333.GC2436@cs181133002.pp.htv.fi>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: zippel@linux-m68k.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Sun, 10 Feb 2008 16:33:33 +0200 Adrian Bunk wrote:

> The attached .config (with current -git) results in a compile 
> error since it contains:
> 
> CONFIG_X86=y
> # CONFIG_EMBEDDED is not set
> CONFIG_SERIO=m
> CONFIG_SERIO_I8042=y
> 
> Looking at drivers/input/serio/Kconfig I simply don't get how this 
> can happen.

Is this from a 'make randconfig' or from one of the *config tools
or done via a text editor (+ make oldconfig)?

---
~Randy
