Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32901 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754432AbbBRTo0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2015 14:44:26 -0500
Message-ID: <54E4EB98.2020407@suse.cz>
Date: Wed, 18 Feb 2015 20:44:24 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Still some race in X509 certificates handling
References: <CA+55aFzgR3BaK4ihHmToZrft4=7NktH1nmi3tV0QMR4Y3QU4Kg@mail.gmail.com>	<417.1423829747@warthog.procyon.org.uk>	<54E49BD2.1010503@suse.cz>	<54E4A37D.1040202@suse.cz> <CA+55aFy8gj_PaMq31Rkax2-0XyAPALQ3RFrB2dJDGCG4SFUdNA@mail.gmail.com>
In-Reply-To: <CA+55aFy8gj_PaMq31Rkax2-0XyAPALQ3RFrB2dJDGCG4SFUdNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Dne 18.2.2015 v 19:49 Linus Torvalds napsal(a):
> On Wed, Feb 18, 2015 at 6:36 AM, Michal Marek <mmarek@suse.cz> wrote:
>>
>> Actually, I sent a patch for the "X.509 certificate list changed"
>> message last October: https://lkml.org/lkml/2014/10/8/306, please apply
>> it. However, this is just a spurious rebuild. The cause for the
>> signature verification error must be something else.
> 
> So I saw the patch originally and it seemed a reasonable cleanup, but
> you're the kbuild maintainer, so I always assumed it would come
> through a standard kbuild pull.

I assumed it would get through David's tree like other modsign patches,
and I forgot about it later. David, is it OK to merge the patch through
the kbuild tree?

Thanks,
Michal
