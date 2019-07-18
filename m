Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:44908 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRRAZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 13:00:25 -0400
Subject: Re: linux-next: Tree for Jul 18 (header build error)
References: <20190718133751.3cf036be@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <127d228c-322d-6349-382b-d304974df148@infradead.org>
Date: Thu, 18 Jul 2019 10:00:22 -0700
MIME-Version: 1.0
In-Reply-To: <20190718133751.3cf036be@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 7/17/19 8:37 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add v5.4 material to your linux-next included branches
> until after v5.3-rc1 has been released.
> 
> Changes since 20190717:
> 

on x86_64, when CONFIG_BLOCK is not set:

  CC      include/linux/iomap.h.s
In file included from <command-line>:0:0:
./../include/linux/iomap.h: In function ‘iomap_sector’:
./../include/linux/iomap.h:76:48: error: ‘SECTOR_SHIFT’ undeclared (first use in this function); did you mean ‘SECTIONS_SHIFT’?
  return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
                                                ^~~~~~~~~~~~


-- 
~Randy
