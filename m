Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:56178 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753219AbZLQDwj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 22:52:39 -0500
Message-ID: <4B29A93D.40207@zytor.com>
Date: Wed, 16 Dec 2009 19:45:01 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org> <adabphy750b.fsf@roland-alpha.cisco.com> <4B29A686.9070603@redhat.com>
In-Reply-To: <4B29A686.9070603@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Roland Dreier <rdreier@cisco.com>, Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>

On 12/16/2009 07:33 PM, Masami Hiramatsu wrote:
> Roland Dreier wrote:
>> Is there any reason not to apply the patch below, to allow more awk
>> implementations to be used?  After all, it's not like we're going to put
>> non-ASCII characters into the map file...
> 
> Actually, the reason why I decided to use character classes is
> [a-z] wasn't same as [[:lower:]] on some environment.
> 
>        For  example,  before the POSIX standard, to match alphanumeric charac-
>        ters, you would have had to write /[A-Za-z0-9]/.  If your character set
>        had  other  alphabetic characters in it, this would not match them, and
>        if your character set collated differently from ASCII, this  might  not
>        even match the ASCII alphanumeric characters.  With the POSIX character
>        classes, you can write /[[:alnum:]]/, and this matches  the  alphabetic
>        and numeric characters in your character set, no matter what it is.
> 
> It seems that "your character set" doesn't mean "what character set are used
>  in the data", it means "what character set build env. is using".
> 
> So, actually, my first released script had used [a-z], but I needed to
> move onto [[:lower:]].
> 

This is correct if you are not in the C locale, but I'm not sure if we
support building the kernel in a non-C locale in the first place.

Do you have a known failure case?  There is also the option of
explicitly setting LC_CTYPE=C.  Sigh.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

