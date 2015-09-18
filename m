Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:34199 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbbIRJHJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2015 05:07:09 -0400
Received: by ykdg206 with SMTP id g206so41064428ykd.1
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2015 02:07:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+ToGPHBHz1k1CTEoA0TsK_g+TPw6yhJJYgRVTOJS2vc-CAKbQ@mail.gmail.com>
References: <CA+ToGPHBHz1k1CTEoA0TsK_g+TPw6yhJJYgRVTOJS2vc-CAKbQ@mail.gmail.com>
Date: Fri, 18 Sep 2015 06:07:08 -0300
Message-ID: <CA+ToGPFVk+5+F673OrFPTgsJkEd8g7MqGReq3c0DGzAjp0n7bA@mail.gmail.com>
Subject: Re: What would it take to port xconfig to Qt5 and gconfig to GTK+ 3?
From: Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2015 at 1:17 AM, Diego Viola <diego.viola@gmail.com> wrote:
> Hi,
>
> I would like to help with this and try to port one or the other to the
> latest toolkits so that we can remove "X windows" from the README.
>
> I.e.,
>
> I want to replace this:
>
> "make xconfig"     X windows (Qt) based configuration tool.
>
> "make gconfig"     X windows (GTK+) based configuration tool.
>
> With this:
>
> "make qconfig"     Qt based configuration tool.
>
> "make gconfig"     GTK+ based configuration tool.
>
> And perhaps keep an alias xconfig to qconfig for backwards
> compatibility. Does it makes sense?
>
> The reason I want to remove "X windows" from the README is that those
> toolkits are no longer dependent on X, there's also Wayland now.
>
> Do any of those work with Qt5/GTK+3 at the moment?
>
> Thanks,
>
> Diego

make xconfig Qt5 progress here:

https://plus.google.com/u/0/+ThiagoMacieira/posts/KyqSXH3Nrcg
