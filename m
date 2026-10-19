Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F54F30E9;
	Mon, 19 Oct 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414080; cv=none; b=giJ3UunKbSWaKoUqHAqhU5WyLXJRCK+P51/qw+AIciGDMAVRPA7MydPgac/G5llCIXb4BAXBLAbgCfOMpSCDAaHKOiZNQblV34erhFOgHIBlD+VyrJ7xu9a7jVHrNtuCaZ5+Tc/7j43kBZrDdUjWzMidbYkzWRhmg6kkhnpqpE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414080; c=relaxed/simple;
	bh=NlCbX6xGI+aHg5MTmtP2OFOJzLnbzmNFxcvNZ6gyV+I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4MyxywSZyfpgclOL3o+iO0s2uGZErPLP0fvNmPTHPXpmqo6azdukDRPCBoFQ8NiuvS4dUy7aa26QOc2VSsqWJh4XFps5T4u0wfVD/BD5XPjOT3BN4JMiVmTR7Dv82158CVG93Rmj5kFHRdGibO7TxO9bhxRz8WvCPYp2CmIWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=06hh/BWQ; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="06hh/BWQ"
Received: from omf10.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id B0F23A7AF8;
	Mon, 19 Oct 2026 12:47:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id D228730;
	Mon, 19 Oct 2026 12:47:50 +0000 (UTC)
Date: Mon, 19 Oct 2026 08:47:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org
Subject: Re: [PATCH 1/5] elf-parse: avoid an undefined shift when checking
 the ELF type
Message-ID: <20261019084749.03c4386b@gandalf.local.home>
In-Reply-To: <20261019000218.3977398-2-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
	<20261019000218.3977398-2-lzsx618@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: D228730
X-Stat-Signature: po9pc3cahisnc3impzjpunqycfaujzy5
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/ZilCxZ72qXukxwMMRdTcc5AfYqOX+iVA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=FBY6LonnvSXJETb+ndh2697w4gY4TeVxS+jSzeJ55Es=; b=06hh/BWQf/nzbfMmudsNikKGjxM4TjJb+/Pbkvd7nQRxoXU8xmbi1dNELiAI0EC2Gi0VbNWCK90WMB9Y2kFKHygKEoM2+3dSdd1OS7JI2WNqjqxZvTdXfmd5cxbO9j7Z4na6vnZ3UGDv3YiQ2EQCw0wa2zzLR79tKuBbU9dafLE=
X-HE-Tag: 1792414070-23159
X-HE-Meta: U2FsdGVkX19TwYByfN76D9sxYT3DOjt6DdszASREUvpHs0sfYCNKlo9wy80EnYw1t6AQcPDcSe5gKtWtNXWgGDYjZJto9SrpHTnTMqmr/O1F0AkkdXs3vlNZplD+kiH4Ltab7mpmKdP7D0Rqjx642AQThPCnhFvjy/tQuEOaTLwcRIq07Ja7pi4N4hcedN6M4ejZkuQynIAQKlyBVH2oSs+0fuFRh+0woHXrllDP9Zd14iTeH32HdusafqLv7USSzepEWC/xhTTwsbj+aXdf4nzkaz69lSnqzF9NbyvdzHlbN3Heq8bgEdIT3SNO4Qkfq7Jpzf/DrKz8P7fQM/UMfl2U1wpWJ7xV

On Sun, 18 Oct 2026 19:02:14 -0500
Leizhen Zhang <lzsx618@gmail.com> wrote:

> elf_parse() takes a bitmap of permitted ELF types and tests it with
> 
> 	type = elf_parser.r2(&ehdr->e32.e_type);
> 	if (!((1 << type) & types)) {
> 
> e_type is a 16-bit field read straight out of the file, so a type of 32
> or more shifts by at least the width of int and the result is undefined;
> 31 shifts into the sign bit. All three users of the parser -- kallsyms,
> sorttable and tracepoint-update -- reach this with e_type unvalidated.
> 
> Found by fuzzing the host ELF tools with mutated object files under
> ASan/UBSan. Reproducer, on any vmlinux (or any ET_REL object for
> tracepoint-update), setting only e_type:
> 
>   $ python3 -c 'import struct
>   d = bytearray(open("vmlinux","rb").read())
>   struct.pack_into("<H", d, 0x10, 40)
>   open("t.elf","wb").write(bytes(d))'
> 
>   $ ./kallsyms --sysmap=/dev/null t.elf
>   scripts/elf-parse.c:94:11: runtime error: shift exponent 40 is too
>   large for 32-bit type 'int'
>       #0 in elf_parse scripts/elf-parse.c:94
> 
> (host tools built with -fsanitize=address,undefined)
> 
> Reject a type that cannot be in the bitmap, and shift an unsigned 1 so
> that a type of 31 stays defined. No valid object changes behaviour: every
> ET_* value the callers put in the bitmap is far below 32, and a file with
> a larger e_type already took the error path -- it just took it through
> undefined behaviour.
> 
> Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
> Assisted-by: LLM ASan UBSan
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
> ---
>  scripts/elf-parse.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
> index ce1c2a670244..9e7d1a4f263f 100644
> --- a/scripts/elf-parse.c
> +++ b/scripts/elf-parse.c
> @@ -91,7 +91,8 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
>  	}
>  
>  	type = elf_parser.r2(&ehdr->e32.e_type);
> -	if (!((1 << type) & types)) {
> +	/* e_type comes from the file and the bitmap only has 32 slots. */

This comment is useless, nuke it.

> +	if (type >= 32 || !((1U << type) & types)) {
>  		fprintf(stderr, "Invalid ELF type file %s\n", fname);
>  		return -1;
>  	}

Other than that, I'm fine with the patch.

-- Steve
