Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2814F402F;
	Mon, 19 Oct 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414681; cv=none; b=OeGxdd6e+q1DF//mqG2TuUdlwVCa9utKr0n4zlmyglvNdv0woq7nfoJoALus7UTKyEejJ67/bz2xw3KsdOIPj+AWeO8MYsprbe+sqXltNbuEozBkmdjM9TV56TEDR2Bk9NHa9C5BSgTos0FxcxUemtkalhoXZabebUdrRVMlKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414681; c=relaxed/simple;
	bh=KrETEAIGMSHlp8WQBaTcXGvB2JepLV8hjfbjVCVjQY0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLTktSbRH1ylINpTc2zaJ6s/qAFPvfm67pyDZW0mfkHwzUGM+OktZF7mKsZ8RlmFgcHUM/WJGPZkXIdzu7+Kird2hhjA8paNuCYPYnR+kDwCa6v4XIIkHG4F7tdJRHBbrF2JkMGYjEOX8eDwcApNLjRQZqkNKn1aLSRHIDiFR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=36Ew3BH3; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="36Ew3BH3"
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id C41F1C068A;
	Mon, 19 Oct 2026 12:57:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 0198230;
	Mon, 19 Oct 2026 12:57:55 +0000 (UTC)
Date: Mon, 19 Oct 2026 08:57:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org
Subject: Re: [PATCH 0/5] elf-parse: validate what the host ELF tools read
 from the file
Message-ID: <20261019085754.1fcadee6@gandalf.local.home>
In-Reply-To: <20261019000218.3977398-1-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: b7w8g9ico4isheszn61h1ijbx3jtp6me
X-Rspamd-Queue-Id: 0198230
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/d2Z40hmssDFNzAfzVcRtccAuLRM9uS44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=tch2Pks4tOnMIGUCrQe8V90RE00nHZAyZeiyUIpjvjA=; b=36Ew3BH3TqKpae23Lc9/LFEfhTdXg9+AFUeFdN/lafdPK7mg8TkP/8wq1wTKB+iM8GYMP8PZ5zCoBvtg8Jh4r0Jp7lsJ5+BVfrwoWZeKvSZRp2443Y2rmttUsHkAMmvo0CAaQWk68Z+8jOqO/WT8jF3SpvyrtRiRXpMv+5CzDSA=
X-HE-Tag: 1792414675-311450
X-HE-Meta: U2FsdGVkX18CPK4u1nJNBI2w5Q74CPAoC9CQGLPN5sshWy7UCRch9kNtnivJfLTrT8zyInc7ut15xncRH/UnZ8xe4C18q5o5VG7FPme/1YWatPdSufhumhwoSq+FbKOq7IGlUFnm9VWXZ+zNzsedkkEBjId64FDIjgBX5fxnIfZVpv6KwM0I2syeBeHpEeZ3DWZ2uDSDcHJ1iLCz2CHu3rT0SCLzB65ikVNsYHylw+WREJM6leY2U3OO1rie82aDmQ7p/uzIQFuDSRChaBRGyAxuTgvP8riksV79xMX2VWbXQo3wNo+cS1vuvx9HfcozjkYUVgey53ROQNAjXrBSi8STtB+wxllE

On Sun, 18 Oct 2026 19:02:13 -0500
Leizhen Zhang <lzsx618@gmail.com> wrote:

> scripts/elf-parse.c takes the section header table, the section indices and
> the symbol table straight out of the file it maps, without checking any of
> them against the mapping. All three users -- kallsyms, sorttable and
> tracepoint-update -- then index with those values, so a truncated or
> corrupted object file makes the tools read outside the mapping, allocate
> from a file-supplied count, or divide by zero instead of printing an error.
> 
> These are build-time tools fed by the local toolchain, so under
> Documentation/process/threat-model.rst this looks like a robustness problem
> rather than a vulnerability: reaching it takes a corrupt or hostile object
> in the build tree. I am leaving that classification for you to review.

Definitely not a security threat here. If the object files are corrupted,
then this is not where you should be detecting it. Unless we change the
purpose of this tool as a corruption detector, this code *expects* the
input to not be corrupt. The reasons for checking various ELF header info
is if someone is porting this code to a new architecture where it doesn't
support it yet, we want to warn.

I'm fine with adding robustness, but not complexity for an issue that
should never exist.

-- Steve
