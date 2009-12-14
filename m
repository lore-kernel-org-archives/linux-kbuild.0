Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:41524 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753460AbZLNNdW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 08:33:22 -0500
Message-ID: <51737.84.105.60.153.1260797592.squirrel@gate.crashing.org>
In-Reply-To: <20091214100613.GA21769@sepie.suse.cz>
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
    <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org>
    <20091214100613.GA21769@sepie.suse.cz>
Date: Mon, 14 Dec 2009 14:33:12 +0100 (CET)
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
From: "Segher Boessenkool" <segher@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

> On Sat, Dec 12, 2009 at 04:26:20PM +0100, Segher Boessenkool wrote:
>> >memcmp() is wrong here, the symbol name can be shorter than
>> >KSYMTAB_PFX
>> >or CRC_PFX.
>>
>> >-		if (memcmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
>> >+		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
>>
>> This doesn't change anything.  In both cases the function will return 0
>> only if all strlen(CRC_PFX) chars match, and in both cases it can access
>> strlen(CRC_PFX) chars (strncmp() is allowed to access characters after
>> the first \0 just fine).
>
> str(n)cmp is not allowed to access characters past the NUL byte.

Let me apologise for the confusion.

strncmp() _can_ access characters past the first NUL byte; and
many implementations do so (they do accesses per 32-bit word,
for example).  But strncmp() behaves as-if it didn't compare
anything past the first null character, so for example causing
a page fault if the string ends just before the end of a memory
page isn't allowed; OTOH, the parameters to memcmp() are required
to point to two objects, each at least "len" bytes big.

So the patch fixes a real problem.  I'm sorry for being dense.

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher

