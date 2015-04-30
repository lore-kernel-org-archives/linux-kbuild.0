Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:38472 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794AbbD3L3m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2015 07:29:42 -0400
Received: by igbhj9 with SMTP id hj9so9909242igb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2015 04:29:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyjMBRAa-hJgZ8=nNs-wwZ+fdkjwJSuS5tOXoLEgieDnw@mail.gmail.com>
References: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com>
	<CAFLxGvyjMBRAa-hJgZ8=nNs-wwZ+fdkjwJSuS5tOXoLEgieDnw@mail.gmail.com>
Date: Thu, 30 Apr 2015 13:29:41 +0200
Message-ID: <CAMpxmJUPECzDboHM5YgTnukQn0PK+MeuQonqQVXKCfmTMQDiKw@mail.gmail.com>
Subject: Re: [RFC] scripts: kerrno.sh - errno translator
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

2015-04-30 13:04 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
> On Thu, Apr 30, 2015 at 12:53 PM, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>> Shell script allowing to find errno definitions and descriptions in the
>> kernel source.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>> This is a simple script I use when seeing messages like:
>>
>>         some_func() failed: -123
>
> What is wrong with a one-liner like:
> gcc -E -dD - < include/uapi/linux/errno.h |grep -E "^#define E.* 123$"

Nothing really - the output is less nice, that's all.

Bart
