Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:36234 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753074AbbBRStk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 13:49:40 -0500
Received: by ierx19 with SMTP id x19so3657403ier.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2015 10:49:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54E4A37D.1040202@suse.cz>
References: <CA+55aFzgR3BaK4ihHmToZrft4=7NktH1nmi3tV0QMR4Y3QU4Kg@mail.gmail.com>
	<417.1423829747@warthog.procyon.org.uk>
	<54E49BD2.1010503@suse.cz>
	<54E4A37D.1040202@suse.cz>
Date: Wed, 18 Feb 2015 10:49:39 -0800
Message-ID: <CA+55aFy8gj_PaMq31Rkax2-0XyAPALQ3RFrB2dJDGCG4SFUdNA@mail.gmail.com>
Subject: Re: Still some race in X509 certificates handling
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: David Howells <dhowells@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Feb 18, 2015 at 6:36 AM, Michal Marek <mmarek@suse.cz> wrote:
>
> Actually, I sent a patch for the "X.509 certificate list changed"
> message last October: https://lkml.org/lkml/2014/10/8/306, please apply
> it. However, this is just a spurious rebuild. The cause for the
> signature verification error must be something else.

So I saw the patch originally and it seemed a reasonable cleanup, but
you're the kbuild maintainer, so I always assumed it would come
through a standard kbuild pull.

So color me a bit confused about the "I wrote a patch last October,
but never bothered to add it to my own trees, so please apply it"
thing.

                        Linus
