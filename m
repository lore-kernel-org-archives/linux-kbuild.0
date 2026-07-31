Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F54230BD5;
	Fri, 31 Jul 2026 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457544; cv=none; b=S+XkjkDl7iyAC7nWRhaC408qjkk1GGThPGLjoC20ngT1+ht86mq1/q4iiaTI53euvYY4KwdP7VVzKrv+QsbOyOTOeSBXOLaJ9gEo4Np2EHmH57QK8Pa0rRJDNtRZbe2aKwZ5vZudtXb0WOU4GKRv7EarrUkwM0Rhp8nPqGMrCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457544; c=relaxed/simple;
	bh=DmtLgMC3HLsjs1X0NcpT3PrzjKhuu0/QjL23x5J9ZzM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=g0Wr5c4swob7sZWWHqGKW1QCcreBOhHQxhveQkZMHA/3M+a+Zjaxc62XqsaxDLuvXYkp7aPXWLC0EMAOevpRI8cZq63DDWJKtCXlKgb75nh6xc4wFWwCk07M/7pFQXoNe/l13kZozAh0LN4ZzKCpmHllGuee5dDP6bgN9RDCYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHPzfgY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHPzfgY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD58B1F000E9;
	Fri, 31 Jul 2026 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785457543;
	bh=XqLqWC9mNsoaYtcdrcWg3Aif+Qk2C27QZfSk/pUyzSA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cHPzfgY+5szsRYaP4YElBqHu+LXkMx7+3XtumFH/Hj+FoCxFv0qWzM/ZTAnvw2o5+
	 kzl11PdbkYP0lxqO8m2ekN9jKSAWQ1bTHV+V3DeDj4ZZ0kZn8uj8ArUMWsim121Ua2
	 Gedy+Ojqhfjbl/1qchTXVe+2mebV8xcWpSxkQG+WVmQwy7GuVOtnJbhAh2XqOh7rHd
	 +at/3gHtFQlHQcoOTK3XGpEMu0GwC3jMpgY4C3I6Jv44XTfZy12B9mgFG2WQY2wdQO
	 ZACEWlm6WHIYcK6YMrr0cL69O/FsoFGJKqJeQDshHtrexAHum4jh4iIP0tnZzrJ25E
	 rZvNZDDQkj6Yg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] Documentation: warn against using int, hex, string
 options as expressions in Kconfig
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, corbet@lwn.net, 
 skhan@linuxfoundation.org, jani.nikula@linux.intel.com, arnd@arndb.de, 
 stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nico@fluxnic.net, 
 officialnaumansabir@gmail.com, rdunlap@infradead.org, 
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
In-Reply-To: <20260730140108.683967-1-julianbraha@gmail.com>
References: <20260730140108.683967-1-julianbraha@gmail.com>
Date: Thu, 30 Jul 2026 17:25:34 -0700
Message-Id: <178545753473.3004192.2499981065379649802.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018; i=nathan@kernel.org;
 h=from:subject:message-id; bh=DmtLgMC3HLsjs1X0NcpT3PrzjKhuu0/QjL23x5J9ZzM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnZr1te+czbLdQ3e9v5FywVUnxvNTUUPf+Iix3lZKhLu
 R3t8D65o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkYyAjwzShWY2b1FO/m16z
 XKDnKPHjRdNjzv4nh0Kf1i7WCqxY9pORYfrNM0umZYZW/X8c2PT6e1+90JabXi/XPv8QrHv93Se
 fAg4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> I've been working on type checking Kconfig, and found some instances of
> dead code due to conditions that always evaluate to false.
> 
> For example:
> 
> config FOO
>   int
> 
> config BAR
>   bool
>   default 'y' if FOO

Drop this quoting of y for clarity?

> This 'if FOO' will always be false, regardless of FOO's value (even when
> FOO=1). The same goes for strings and hex.

Hmmm, it might be kind of nice to either:

1. Warn about this in Kconfig directly (if possible)
2. Support this usage in Kconfig how one would intuitively expect from
   either C or Python where symbols with values of 0, 0x0, and '' would
   be treated as false and every other value set as true.

> See also this related patch:
> https://lore.kernel.org/all/20260729210546.394392-1-julianbraha@gmail.com/
> 
> Let's warn users against this usage.

That said, until either of those potentially happen, this patch seems
fine.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

