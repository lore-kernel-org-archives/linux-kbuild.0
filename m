Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:63350 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945AbaALQO4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jan 2014 11:14:56 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so2177133pad.30
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Jan 2014 08:14:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140106204706.GA16924@leaf>
References: <20140106204706.GA16924@leaf>
Date: Sun, 12 Jan 2014 11:14:56 -0500
Message-ID: <CA+C-WL_Z6TuWTO00gzgJo3+D-kHfjFBrfACqpaDCNxP23-LN_g@mail.gmail.com>
Subject: Re: #pragma once?
From: Patrick Palka <patrick@parcs.ath.cx>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Rashika Kheria <rashika.kheria@gmail.com>

On Mon, Jan 6, 2014 at 3:47 PM, Josh Triplett <josh@joshtriplett.org> wrote:
> Does anyone have any objection to the use of "#pragma once" instead of
> the usual #ifndef-#define-...-#endif include guard?  GCC, LLVM/clang,
> and the latest Sparse all support either method just fine.  (I added
> support to Sparse myself.)  Both have equivalent performance.  "#pragma
> once" is simpler, and avoids the possibility of a typo in the defined
> guard symbol.

Unfortunately in GCC #pragma once is slower and slightly buggier than
regular include guards:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=52566
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58770
