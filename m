Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35924 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515AbbKRUWy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2015 15:22:54 -0500
Received: by pacdm15 with SMTP id dm15so55193935pac.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2015 12:22:53 -0800 (PST)
Reply-To: vomlehn@texas.net
Subject: Re: out-of-tree build with external module
References: <1447858006.4104.38.camel@alcnetworx.de>
From: "dvomlehn@gmail.com" <dvomlehn@gmail.com>
Message-ID: <564CDE1B.3020806@gmail.com>
Date: Wed, 18 Nov 2015 12:22:51 -0800
MIME-Version: 1.0
In-Reply-To: <1447858006.4104.38.camel@alcnetworx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tino Mettler <tino.mettler@alcnetworx.de>, linux-kbuild@vger.kernel.org

On 11/18/2015 06:46 AM, Tino Mettler wrote:
> Hi,
>
> I want to build an external module out-of-tree. I tried this:
>
> make -C <kernel-source> KBUILD_OUTPUT=<out-of-tree-path> M=<external-module> modules
>
> However, the result is put to the source path specified by M=, whereas a
> normal kernel build (without M=) but otherwise same parameters puts the
> result to <out-of-tree-path>.
>
> Any hints what I'm doing wrong?
>
> Regards,
> Tino
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

When building a module out of tree, I set up a directory in which the 
source and Make file reside. I don't use KBUILD_OUTPUT and set M to 
$$PWD. I do the build in the directory specified by M and the result is 
put in that directory. This is pretty much exactly what is defined in 
the Kbuild documentation in kbuild/modules.txt (see the examples in 
sections 3.1-3.3). Are you looking for something else?

-- 
David VL

