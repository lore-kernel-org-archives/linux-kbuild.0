Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from static-71-162-243-5.phlapa.fios.verizon.net ([71.162.243.5]:33733
	"EHLO grelber.thyrsus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936338AbZLQEMi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 23:12:38 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: CONFIG_KPROBES=y build requires gawk
Date: Wed, 16 Dec 2009 22:12:31 -0600
References: <20091216235617.GA12267@hexapodia.org> <4B29A686.9070603@redhat.com> <4B29A93D.40207@zytor.com>
In-Reply-To: <4B29A93D.40207@zytor.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912162212.32631.rob@landley.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masami Hiramatsu <mhiramat@redhat.com>, Roland Dreier <rdreier@cisco.com>, Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wednesday 16 December 2009 21:45:01 H. Peter Anvin wrote:
> On 12/16/2009 07:33 PM, Masami Hiramatsu wrote:
> > Roland Dreier wrote:
> >> Is there any reason not to apply the patch below, to allow more awk
> >> implementations to be used?  After all, it's not like we're going to put
> >> non-ASCII characters into the map file...
> >
> > Actually, the reason why I decided to use character classes is
> > [a-z] wasn't same as [[:lower:]] on some environment.
> >
> >        For  example,  before the POSIX standard, to match alphanumeric
> > charac- ters, you would have had to write /[A-Za-z0-9]/.  If your
> > character set had  other  alphabetic characters in it, this would not
> > match them, and if your character set collated differently from ASCII,
> > this  might  not even match the ASCII alphanumeric characters.  With the
> > POSIX character classes, you can write /[[:alnum:]]/, and this matches 
> > the  alphabetic and numeric characters in your character set, no matter
> > what it is.
> >
> > It seems that "your character set" doesn't mean "what character set are
> > used in the data", it means "what character set build env. is using".
> >
> > So, actually, my first released script had used [a-z], but I needed to
> > move onto [[:lower:]].
>
> This is correct if you are not in the C locale, but I'm not sure if we
> support building the kernel in a non-C locale in the first place.
>
> Do you have a known failure case?  There is also the option of
> explicitly setting LC_CTYPE=C.  Sigh.

I remember first being surprised when Ubuntu "upgraded" to utf8 locale and 
"sort" became case insensitive.  Took a while to track down why so much stuff 
was breaking.

I've exported LC_ALL=C in all my build environments ever since.

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
