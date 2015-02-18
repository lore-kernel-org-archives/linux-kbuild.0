Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40047 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751711AbbBROgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 09:36:47 -0500
Message-ID: <54E4A37D.1040202@suse.cz>
Date: Wed, 18 Feb 2015 15:36:45 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Still some race in X509 certificates handling
References: <CA+55aFzgR3BaK4ihHmToZrft4=7NktH1nmi3tV0QMR4Y3QU4Kg@mail.gmail.com> <417.1423829747@warthog.procyon.org.uk> <54E49BD2.1010503@suse.cz>
In-Reply-To: <54E49BD2.1010503@suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2015-02-18 15:04, Michal Marek wrote:
> On 2015-02-13 13:15, David Howells wrote:
>> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>
>>> When it happens, I can do a rebuild, and the build will say
>>>
>>>    X.509 certificate list changed
>>>
>>> which is kind of odd, since the list should *always* be just that
>>> single key for me (ie "./signing_key.509").
>>
>> Did you by any chance set aside a build tree that went wrong?  If so, could
>> you have a look to see what's in:
>>
>> 	<builddir>/kernel/.x509.list
>> 	<builddir>/kernel/x509_certificate_list (note this is binary)
>> 	<builddir>/x509.genkey
>>
>> and make sure that:
>>
>> 	<builddir>/signing_key.priv
>> 	<builddir>/signing_key.x509
>>
>> both exist.  I wonder if the problem might perhaps be due to one of
>> signing_key.priv or signing_key.x509 getting removed somehow - but not both.
> 
> It could also be due to the usage of realpath when building the

Actually, I sent a patch for the "X.509 certificate list changed"
message last October: https://lkml.org/lkml/2014/10/8/306, please apply
it. However, this is just a spurious rebuild. The cause for the
signature verification error must be something else.

Michal
