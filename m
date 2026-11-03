Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739374;
	b=ImilZuIZEj5ki1NTitrLuMY5oGqQ2Gc337zQXotfGYx6iMp6kzoYt0gXIZQq5e/43/mZ
	 9EqyFFq3HIob+VgC87he+KEaviHzdDylwKX5EDG2oWHcaNi2bL0uxQbXsTnq0hJq2WKSf
	 VoQS0JJOxSun0gIIrz4Rdw4+3ROErklnrdQjGS3fkAdvlLM6OsiXdRR0rtjE0aUwkGdYo
	 GoI4fAfrAXrjezjQWatbYRokgZYSYbxhQkde6KX/7Z3K8UdsF4ECVxk8iYjJj0/WFzDYK
	 BgGJ5bpv6O52ll/11xHPOqo0vmW8KUPJPGgYNn2Um/hJb8Y/cLZw2rrmZfpKHNWTI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739374;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=C7qP4m3Iwu8x8lm9CWZGBmS+EfzLzfwwsv0RIlsw9Xo=;
	b=RivKlmepiRBi53ewWQW7fdQP5tpfI825cp7NzdZHEIAN5swcspHA6B+G2udkgNCfReiP
	 +7dGxjgEFjZKRBr2/8nDExH9uAlUPN5fV2W+FOxlpjIZT1GtS+d5m+lNMA2wP7vZtINce
	 18GGjrQy+YkDZacKSMTwyWNmgETHU9ihwWqJn+xDibnyV5b7XaGU60K2k40A9897he1eb
	 wtVPR23sPQia0pKyYewbblGUYNTJJ+tWs0AyWyrkZmBVzOhvUbOhZ+Y/8spmji6o3xsZR
	 u6WnKWgjuOJygfBa7azeN+QZ/Mq9mkivmhoekpXBz7ML2YvkWsnNQHY6AbeAiVXSulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG9Ybt1S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id AFC21606A331
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG9Ybt1S
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F3BCE1F000C1;
	Tue,  3 Nov 2026 20:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793739373;
	bh=C7qP4m3Iwu8x8lm9CWZGBmS+EfzLzfwwsv0RIlsw9Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CG9Ybt1ShjANcipo8YKqicI1KoQoIBZ5f5N/R5oKA5WIWRRyoBmg7Hw+dpX1RxrC8
	 TV+Q6m0sA2kgs0cwNFyRF0fDaMxGFuKDBekoFbyJ0+bvZ6l9AE1Rqc60WDWIkUtyaZ
	 M0wrojlixC1yt3ZVQ99DMH2bZPhDakyneB6i+LGzkaPe88+fcZn/X/gCeTjksRQlRE
	 jbcuE+dG2jGBKK5Xz2a5bg3B62sPvlggenH5fyXAcyfFFSYjqa9pUrsIVrRIRK+c1p
	 5qLqazQcvq3nnwHlg+mRAqYW4OTrVL/dJbECnkgUXpoV+xpEz69EOlX3T2tsnyiL1H
	 qIRW5YgdfgocA==
Date: Tue, 3 Nov 2026 21:55:34 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nathan@kernel.org, hamdy.aea@protonmail.com,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: file-size: propagate ls failures
Message-ID: <aupKRv-2wbdei-Dg@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Hamdy Abou El Anein <info@daylightlinux.ch>, nathan@kernel.org,
	hamdy.aea@protonmail.com, linux-kbuild@vger.kernel.org
References: <20261103164204.129681-1-info@daylightlinux.ch>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103164204.129681-1-info@daylightlinux.ch>

On Tue, Nov 03, 2026 at 05:42:04PM +0100, Hamdy Abou El Anein wrote:
> From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
> 
> When ls fails, set -- succeeds with no arguments and printf emits an
> empty line with status zero. A missing input is thus reported as a
> successful size query.
> 
> Capture the listing in a separate assignment under errexit before
> splitting its fields, so an ls failure stops the script.
> 
> Tested missing and empty files, a 123-byte file with spaces in its name,
> and a symbolic link. Successful output remains unchanged, including
> the link's own size.
> 
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.

While implementing shell scripts with 'set -e' is a good thing, we
cannot apply this.

NACK

The reported issue is not reproducible with all usage of file-size.sh
within the Linux tree.  More important:  if file-size.sh fails with an
exit code, it even breaks some callers, which expect file-size.sh to
succeed always.  If you want to investigate, check all findings of
file-size.sh within the tree.

Kind regards
Nicolas

