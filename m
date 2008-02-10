Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:52157 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751140AbYBJOdi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 09:33:38 -0500
Date: Sun, 10 Feb 2008 16:33:33 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: kconfig creates strange (invalid?) configuration
Message-ID: <20080210143333.GC2436@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

The attached .config (with current -git) results in a compile 
error since it contains:

CONFIG_X86=y
# CONFIG_EMBEDDED is not set
CONFIG_SERIO=m
CONFIG_SERIO_I8042=y

Looking at drivers/input/serio/Kconfig I simply don't get how this 
can happen.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

