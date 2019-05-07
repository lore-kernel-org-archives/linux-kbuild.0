Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f48.google.com ([209.85.167.48]:43311 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEGToz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 15:44:55 -0400
Date: Tue, 07 May 2019 22:44:48 +0300
In-Reply-To: <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com> <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com> <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the generated config
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <C3B61434-2789-4643-B936-A056B073F1CC@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



7 May 2019 15:29:26 GMT+03:00, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>This patch breaks "make testconfig".
>
>Please get rid of the "endof" for the rootmenu
>at the end of the .config file.

Thanks a lot for having a look! 
I'll fix this issue, test it and return with the next version. 

Best regards, 
Alexander 
