Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42170 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750933AbbD3MZO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2015 08:25:14 -0400
Date: Thu, 30 Apr 2015 14:25:12 +0200
From: David Sterba <dsterba@suse.cz>
Subject: Re: [RFC] scripts: kerrno.sh - errno translator
Message-ID: <20150430122512.GE4996@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <1430391215-13768-1-git-send-email-bgolaszewski@baylibre.com>
 <CAFLxGvyjMBRAa-hJgZ8=nNs-wwZ+fdkjwJSuS5tOXoLEgieDnw@mail.gmail.com>
 <CAMpxmJUPECzDboHM5YgTnukQn0PK+MeuQonqQVXKCfmTMQDiKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJUPECzDboHM5YgTnukQn0PK+MeuQonqQVXKCfmTMQDiKw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Apr 30, 2015 at 01:29:41PM +0200, Bartosz Golaszewski wrote:
> 2015-04-30 13:04 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
> > On Thu, Apr 30, 2015 at 12:53 PM, Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> >> Shell script allowing to find errno definitions and descriptions in the
> >> kernel source.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >> ---
> >> This is a simple script I use when seeing messages like:
> >>
> >>         some_func() failed: -123
> >
> > What is wrong with a one-liner like:
> > gcc -E -dD - < include/uapi/linux/errno.h |grep -E "^#define E.* 123$"
> 
> Nothing really - the output is less nice, that's all.

I'd find a helper script useful in situations where I don't know the
error code immediatelly and have to convert it from a hexa value first.
Eg. when RAX contains an error code after a BUG_ON:

RAX: 00000000ffffffe4

this translates to -28 == -ENOSPC.
