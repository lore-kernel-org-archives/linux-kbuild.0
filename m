Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.237]:63327 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753134AbYFNK1D convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jun 2008 06:27:03 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2879036rvb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Jun 2008 03:27:03 -0700 (PDT)
Message-ID: <8499950a0806140327l267186c5h621bec0ea3995842@mail.gmail.com>
Date: Sat, 14 Jun 2008 11:27:02 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
In-Reply-To: <1213437917.26255.335.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
	 <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
	 <1213437917.26255.335.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

> _Sometimes_ you can just append C files together and they happen to
> work. But not always. A simple case where it fails would be when you
> have a static variable with the same name in two different files.

Afaik in the kernel global static variables are not appreciated much. In any
case file scope can be easily added by s/// to its name in text compile
stage.

There are much more problems with conditional includes and other source
configuration crutches.

> The compiler will do the right thing there., while naïve concatenation
> of C files will not.

That was an example, of course there must be pre-cc text processing stage.

> Of course, it's _possible_ to have external text processing cope with
> this case somehow -- you'd probably feed it through the preprocessor,
> then look at the output of the preprocessor and make the variable names
> unique, perhaps?

Even before cpp. But twisted includes/ifdef's cannot be handled without it.

> And then move on to the next case which is already handled in gcc...

To gain size reduction, some register-wide static variables (ints), which are
usually for some state-handling, can be glued together, if whole picture
permits: all flags fit in limited bit range, needed shift is added textually.

Again developer doing clear/documented semantics, text-based
transformations is needed. Can it be done by GCC optimizing stages?
(However Rusty may try to do that with cpp :)

> But really, I'd rather just leave it to the compiler. And it's not
> because I have some masochistic fascination with makefiles :)
-- 
sed 'sed && sh + olecom = love' << ''
-o--=O`C
 #oo'L O
<___=E M
