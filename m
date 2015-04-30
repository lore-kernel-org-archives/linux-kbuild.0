Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vn0-f54.google.com ([209.85.216.54]:41884 "EHLO
	mail-vn0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730AbbD3LEs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2015 07:04:48 -0400
MIME-Version: 1.0
In-Reply-To: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com>
References: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com>
Date: Thu, 30 Apr 2015 13:04:47 +0200
Message-ID: <CAFLxGvyjMBRAa-hJgZ8=nNs-wwZ+fdkjwJSuS5tOXoLEgieDnw@mail.gmail.com>
Subject: Re: [RFC] scripts: kerrno.sh - errno translator
From: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Apr 30, 2015 at 12:53 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> Shell script allowing to find errno definitions and descriptions in the
> kernel source.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> This is a simple script I use when seeing messages like:
>
>         some_func() failed: -123

What is wrong with a one-liner like:
gcc -E -dD - < include/uapi/linux/errno.h |grep -E "^#define E.* 123$"

-- 
Thanks,
//richard
