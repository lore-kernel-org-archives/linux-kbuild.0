Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37081 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDXMFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Apr 2019 08:05:14 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 1/1] kconfig: Terminate menu blocks with a newline in the
 generated config
References: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
 <CAK7LNAQP8ys181hL9EtGVoQppn_-aLn+Ufineebf396rDn-Ezw@mail.gmail.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <740dce6e-3e15-2031-707a-43a6dd827929@linux.com>
Date: Wed, 24 Apr 2019 15:05:05 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQP8ys181hL9EtGVoQppn_-aLn+Ufineebf396rDn-Ezw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 24.04.2019 13:09, Masahiro Yamada wrote:
> On Sat, Apr 20, 2019 at 4:12 AM Alexander Popov <alex.popov@linux.com> wrote:
>>
>> Currently menu blocks start with a pretty header but end with nothing in
>> the generated config. So next config options stick together with the
>> options from the menu block.
>>
>> Let's terminate menu blocks with a newline in the generated config.
>>
>> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> 
> The readability of the .config could be improved somehow,
> but this patch is not the right one.

Masahiro, thanks for having a look.
I've just sent v2 which does this task much better.

Best regards,
Alexander
