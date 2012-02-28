Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:56517 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754368Ab2B1HVR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Feb 2012 02:21:17 -0500
Date: Tue, 28 Feb 2012 08:21:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Fwd: [tip:x86/x32] x32:  Warn and disable rather than error if
	binutils too old
Message-ID: <20120228072115.GA2213@merkur.ravnborg.org>
References: <tip-0bf6276392e990dd0da0ccd8e10f42597d503f29@git.kernel.org> <4F4C0877.5000804@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F4C0877.5000804@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Mon, Feb 27, 2012 at 02:49:27PM -0800, H. Peter Anvin wrote:
> Kbuild people - for the lack of a way to doing toolchain dependencies in
> Kconfig I'm doing this right now for x32 support.  I am a little unclear
> if this is the right thing to do, especially if I should be using := or

Looks good at first look.

":=" is almost always the right choice if this is not part of a rule somewhere.
With ":=" the rhs is only evaluated once and the result stored in the
variable on the lhs.

In this particular case you only use the lhs once - so there is no
real difference.

Another important difference is that with ":=" the rhs is evaluated when
make see it first time.
With "=" make defer it until the lhs is used.

again in you case there is no difference as you use the lhs just after
you have the assignment.

[But I guess you already knew all this...]

	Sam


