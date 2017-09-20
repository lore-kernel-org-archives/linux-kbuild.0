Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32539 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751612AbdITJ5P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 05:57:15 -0400
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com [209.85.161.174]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v8K9uxpV014199
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Sep 2017 18:56:59 +0900
Received: by mail-yw0-f174.google.com with SMTP id s62so1529881ywg.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Sep 2017 02:56:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170902222101.GA5414@nicolas-netbook>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
 <20170818222052.22375-3-nicolasporcel06@gmail.com> <CAK7LNAQWFKFcm2PbOc-wc2bP1YmKBObhyyWr51mw6MCZRzVGOQ@mail.gmail.com>
 <20170902222101.GA5414@nicolas-netbook>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Sep 2017 18:56:17 +0900
Message-ID: <CAK7LNASmS0tNXvo=p_j_yKgNnmgGP7PpejB-aJWpUL05MrKRgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: support out of tree KCONFIG_CONFIG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Porcel <nicolasporcel06@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-09-03 7:21 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
> On Sat, Sep 02, 2017 at 04:31:44PM +0900, Masahiro Yamada wrote:
>> 2017-08-19 7:20 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
>>
>> If the kernel source is not writable, O= should be used.
>
> You are right, I didn't know O= worked for kernel config.
>
>> I think KCONFIG_CONFIG only contains a file name
>> and this restriction is intentional
>> because conf_write() might be called with a directory path (for
>> example from gconf.c)
>>
>>
>> If we change the behavior,
>> I think conf_write() should just error-out
>> when directory path is given.
>>
>
> When I build a kernel, I set KCONFIG_CONFIG to reference a file on a
> different file-system than the build directory. It used to work before
> kernel 4.12, hence my patch.
>
> I now realize that I misunderstood the purpose of this variable. It
> also means that it is not possible to store the configuration file
> outside the build directory when using silentconfig for instance.


Some targets can choose the save path of the .config file.

For example, run "make gconfig"
then choose "File  ->  Save as"
from the menu.


But, silentoldconfig does not have a way to save .config
out out the build tree.


> Of course, I can use a symlink with KCONFIG_OVERWRITECONFIG, but it
> may be an interesting feature to be able to specify an absolute path
> for the kernel config file.



conf_write() may be called with a directory path,
in this case, the KCONFIG_OVERWRITECONFIG is appended
as the base name.

If we support an absolute path in KCONFIG_OVERWRITECONFIG,
I think it is strange.




-- 
Best Regards
Masahiro Yamada
