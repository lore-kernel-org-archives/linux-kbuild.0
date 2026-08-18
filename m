Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2C2FC037;
	Tue, 18 Aug 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079678; cv=none; b=QSKtce/6ML2qRvfNdwY56ZAXoCniEa6yR3mZSIh6cc+cKlDzLWvGJi09WS30TcL7EbICNMASw0TX1IIkCbDL8SX+BPXhCdxZCIYsWwykNHMOxFBvUkIdYTqst6LdXZaY+fn8ikSiQneebrJoQbCmyHOB4f6vsh78JgSAPu4puYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079678; c=relaxed/simple;
	bh=m9w5eoQZ4rt/3ODWDAksyJ8VSU2xyVRWFdc2DHxAaJA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sKp6eHq0XpNruuw39vi0zzci3czv9a9WhLrqzHdL2yahSgFXxiw6wahLgBhY63jLcoC807NY5beqXc4YH380MXHyLs0fYsGc8Ux+nUhU1NF1liYOsrSY11u+Q9PiZGRUdoi/uWloeUSAbkNMh9H0wPkILcPqZGVedEBj16zY8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hws0t3Jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hws0t3Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDDA1F000E9;
	Tue, 18 Aug 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787079677;
	bh=/r7e11CshyevPzXEaBt9Ied4wxOibWIkPy6qMSss9Mo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hws0t3JyqmMI92qP98aU3nl6biwNhhY2U3igsc1NGU/0fnTs3kHGkAl8nJ590/17a
	 8fCfo5wZQ+8EKl4DuorTpPwZjubIx9KGhDWTWV3NxtyXuRIZVApDhxwDtUMPNpWtnX
	 S9d/9pEVpTATjWc2e1dyHvU6e0O8gfvm+VelPcP3qLgNvjS08E+W89KHvJ5UXJiYTS
	 YhGCfHgo0vRBqZsSR3ZqoM/nmPo+8F6hdwWeV+WiauiB1gzgu2LGLmkQxUCWm34U5d
	 tp8iO9LmovNB/flO+o1vRIUR2/h5muOKhCw41+2JwLE7Ye7uSaB6DBCx4Gq/8afkwD
	 BWq8ScijBaA1Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] scripts: Make the code use consistent syntax
From: Nathan Chancellor <nathan@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260817230915.3860140-1-unixbhaskar@gmail.com>
References: <20260817230915.3860140-1-unixbhaskar@gmail.com>
Date: Tue, 18 Aug 2026 12:01:00 -0700
Message-Id: <178707966024.2113250.6051873542503340409.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=nathan@kernel.org;
 h=from:subject:message-id; bh=m9w5eoQZ4rt/3ODWDAksyJ8VSU2xyVRWFdc2DHxAaJA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFktq99e/fv3j6xf8pKnIpO4bu3ZlPFW/ee3UB/GLKb0u
 Yyv+doqOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEEuYzMtx6934bQ5e4TyCn
 6qRDgjfFioUilFZu/n64SqTR4UDplDBGhs9pt+bXfRJPt2rPvPBLZMGBu1yXFhvNniJd5mLWqVv
 QxwAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> The code was using a different form of syntax. So, make it more
> consistent with a similar kind of syntax.

Please make the commit subject and message more descriptive for what is
being modified (scripts/mkcompile_h, not scripts in general) and how/why
it is being modified. What you have is just too generic in my opinion.
Maybe something like

  scripts/mkcompile_h: Update LINUX_COMPILE_HOST command substitution syntax

  The assignment of LINUX_COMPILE_HOST uses the classic backtick style
  for its command substitution but the rest of the script uses the more
  common '$()'. Update LINUX_COMPILE_HOST to match for consistency.

Otherwise, change itself seems fine. I will pick up your next revision
for 7.4 when 7.3-rc1 is out.

-- 
Cheers,
Nathan

