Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:37571 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752469AbbBMQ4L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Feb 2015 11:56:11 -0500
Received: by iecrl12 with SMTP id rl12so18530213iec.4
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2015 08:56:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <417.1423829747@warthog.procyon.org.uk>
References: <CA+55aFzgR3BaK4ihHmToZrft4=7NktH1nmi3tV0QMR4Y3QU4Kg@mail.gmail.com>
	<417.1423829747@warthog.procyon.org.uk>
Date: Fri, 13 Feb 2015 08:56:10 -0800
Message-ID: <CA+55aFysknUfcrA33=oPbyhyuHvvfytkAoNBX8WnLfHSTVurhg@mail.gmail.com>
Subject: Re: Still some race in X509 certificates handling
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Feb 13, 2015 at 4:15 AM, David Howells <dhowells@redhat.com> wrote:
>
> Did you by any chance set aside a build tree that went wrong?

No, I didn't, I just wanted to get my testing done so that I could push out.

> Btw, do you use O=<builddir> when you're building?

Nope. Building in the normal source directory. I've never seen the
point of "O=" outside of "one source tree, many objects trees", and
even that is rather questionable in the age of sane and efficient
source control.

> I would really like to leave O, CN and emailAddress in here because these are
> the fields that x509_fabricate_name() uses in the kernel.

I don't mind that part. It's just that "unknown module key
'Magrathea'" that I don't think is exactly obvious unless you've seen
it before..

Just replacing "Magrathea Glacier signing key" with "Kernel build-time
random signing key" would make the error messages when the key is
wrong a bit more natural, wouldn't you say?

Perhaps a bit square and boring, but ..

                           Linus
