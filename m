Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:60800 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754065AbaIXSzs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 24 Sep 2014 14:55:48 -0400
Received: by mail-pd0-f179.google.com with SMTP id ft15so9050295pdb.24
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Sep 2014 11:55:48 -0700 (PDT)
Message-ID: <542313B1.1020803@converseincode.com>
Date: Wed, 24 Sep 2014 11:55:45 -0700
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: How to build the kernel with Clang?
References: <20140919131021.EE3E.AA925319@jp.panasonic.com>
In-Reply-To: <20140919131021.EE3E.AA925319@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org, llvmlinux@lists.linuxfoundation.org
Cc: Vinicius Tinti <viniciustinti@gmail.com>, linux-kernel@vger.kernel.org

On 09/18/14 21:10, Masahiro Yamada wrote:
> Hi Clang folks,
>
>
> I'd like to know the status of Clang support
> in the Linux mainline.
Still a work in progress.  You still need to use the LLVMLinux patches 
on top of mainline to get it to work. We're upstreaming those patches as 
fast as we can.

> I can see some "clang" specific parts in makefiles,
> so I guess Clang is already supported to a certain extent.
Some of the required parts are there. But mainline currently won't 
compile out of the box with clang.

> I just tried to build with "HOSTCC=clang CC=clang"
> but it would not work.
>
> Is there any tips I am missing here?
Try building from our kernel repo listed on http://llvm.linuxfoundation.org

Thanks,

Behan

-- 
Behan Webster
behanw@converseincode.com

