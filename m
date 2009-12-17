Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sj-iport-6.cisco.com ([171.71.176.117]:64402 "EHLO
	sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936385AbZLQEPz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 23:15:55 -0500
From: Roland Dreier <rdreier@cisco.com>
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org>
	<adabphy750b.fsf@roland-alpha.cisco.com> <4B29A686.9070603@redhat.com>
Date: Wed, 16 Dec 2009 20:15:53 -0800
In-Reply-To: <4B29A686.9070603@redhat.com> (Masami Hiramatsu's message of
	"Wed, 16 Dec 2009 22:33:26 -0500")
Message-ID: <ada3a3a6xs6.fsf@roland-alpha.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>


 >        For  example,  before the POSIX standard, to match alphanumeric charac-
 >        ters, you would have had to write /[A-Za-z0-9]/.  If your character set
 >        had  other  alphabetic characters in it, this would not match them, and
 >        if your character set collated differently from ASCII, this  might  not
 >        even match the ASCII alphanumeric characters.  With the POSIX character
 >        classes, you can write /[[:alnum:]]/, and this matches  the  alphabetic
 >        and numeric characters in your character set, no matter what it is.

I'm not sure I understand this, although I'm not a character set expert.
But is there really some possible locale + awk implementation where an
awk script, written in pure ASCII, operating on a pure ASCII input file,
will have [A-Za-z0-9] match a different set of ASCII characters than
[[:alnum:]] will match?

 - R.
