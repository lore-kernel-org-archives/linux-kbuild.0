Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34632 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932801AbZLQDbf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 22:31:35 -0500
Message-ID: <4B29A686.9070603@redhat.com>
Date: Wed, 16 Dec 2009 22:33:26 -0500
From: Masami Hiramatsu <mhiramat@redhat.com>
MIME-Version: 1.0
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org> <adabphy750b.fsf@roland-alpha.cisco.com>
In-Reply-To: <adabphy750b.fsf@roland-alpha.cisco.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>

Roland Dreier wrote:
> Is there any reason not to apply the patch below, to allow more awk
> implementations to be used?  After all, it's not like we're going to put
> non-ASCII characters into the map file...

Actually, the reason why I decided to use character classes is
[a-z] wasn't same as [[:lower:]] on some environment.

       For  example,  before the POSIX standard, to match alphanumeric charac-
       ters, you would have had to write /[A-Za-z0-9]/.  If your character set
       had  other  alphabetic characters in it, this would not match them, and
       if your character set collated differently from ASCII, this  might  not
       even match the ASCII alphanumeric characters.  With the POSIX character
       classes, you can write /[[:alnum:]]/, and this matches  the  alphabetic
       and numeric characters in your character set, no matter what it is.

It seems that "your character set" doesn't mean "what character set are used
 in the data", it means "what character set build env. is using".

So, actually, my first released script had used [a-z], but I needed to
move onto [[:lower:]].

Thank you,


-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com

