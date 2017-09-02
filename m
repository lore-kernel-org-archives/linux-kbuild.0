Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38068 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752770AbdIBWVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 18:21:07 -0400
Received: by mail-wr0-f194.google.com with SMTP id j3so1632120wrb.5
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Sep 2017 15:21:07 -0700 (PDT)
Date: Sun, 3 Sep 2017 00:21:01 +0200
From: Nicolas Porcel <nicolasporcel06@gmail.com>
Subject: Re: [PATCH 2/2] kconfig: support out of tree KCONFIG_CONFIG
Message-ID: <20170902222101.GA5414@nicolas-netbook>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
 <20170818222052.22375-3-nicolasporcel06@gmail.com>
 <CAK7LNAQWFKFcm2PbOc-wc2bP1YmKBObhyyWr51mw6MCZRzVGOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQWFKFcm2PbOc-wc2bP1YmKBObhyyWr51mw6MCZRzVGOQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Sep 02, 2017 at 04:31:44PM +0900, Masahiro Yamada wrote:
> 2017-08-19 7:20 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
> 
> If the kernel source is not writable, O= should be used.

You are right, I didn't know O= worked for kernel config.

> I think KCONFIG_CONFIG only contains a file name
> and this restriction is intentional
> because conf_write() might be called with a directory path (for
> example from gconf.c)
> 
> 
> If we change the behavior,
> I think conf_write() should just error-out
> when directory path is given.
> 

When I build a kernel, I set KCONFIG_CONFIG to reference a file on a
different file-system than the build directory. It used to work before
kernel 4.12, hence my patch.

I now realize that I misunderstood the purpose of this variable. It
also means that it is not possible to store the configuration file
outside the build directory when using silentconfig for instance.

Of course, I can use a symlink with KCONFIG_OVERWRITECONFIG, but it
may be an interesting feature to be able to specify an absolute path
for the kernel config file.

Best regards,

-- 
Nicolas Porcel
