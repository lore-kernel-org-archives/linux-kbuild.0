Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37646 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270AbcFSShl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Jun 2016 14:37:41 -0400
Received: by mail-wm0-f54.google.com with SMTP id a66so50956304wme.0
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Jun 2016 11:37:40 -0700 (PDT)
Date: Sun, 19 Jun 2016 20:44:20 +0200
From: Emese Revfy <re.emese@gmail.com>
Subject: Re: [RFC][PATCH] gcc-plugins: abort builds cleanly when not
 supported
Message-Id: <20160619204420.95bf779ca0273dbda7415c27@gmail.com>
In-Reply-To: <20160618181437.GA2633@www.outflux.net>
References: <20160618181437.GA2633@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, kernel-hardening@lists.openwall.com

On Sat, 18 Jun 2016 11:14:37 -0700
Kees Cook <keescook@chromium.org> wrote:

> When the compiler doesn't support gcc plugins (either due to missing
> headers or too old a version), report the problem and abort the build
> instead of emitting a warning and letting the build founder with arcane
> compiler errors.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> I think this greatly improves the failure case when trying to use the
> gcc plugin infrastructure. Emese, what do you think of this?

I like it, it has much better error handling. :)

-- 
Emese
