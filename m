Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FFD51DDFB;
	Tue, 29 Sep 2026 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683881; cv=none; b=inMdoE/cm+K2+SM4sNl7UmLNyvqWejSPsTd+memfHw0aqVO1Dz2remgKcmWYvJJ0e2ZkRLuRjhvJgrE8wJYzvzvrgxdZkReLTYvU/3QynoXiACThIHL/w5MAf6dVy2RFeYAuji47qeKOzrYCR3MPKYVWSugQpa2j6MFRJ0LAQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683881; c=relaxed/simple;
	bh=aJs6InMOjAJ8hrSrvg9tSxpTEaTjKPdFsobdkWQahPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt1RizxIfbQ9WR5bkyvnh4eBsiXAw77Tj1LXR1VFfGpVzA7TLP3jZcUBZ5H6BQBwjCd86B6MNARrySxIdJuewxYDdbQPRvxFicXXYdT209d8NFA6KzvplMeTk4o04YaezN31wX7vB/fMZOHZPeA9g6jTqKpox4uMSw4IZdQ7zHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz8fyWyi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz8fyWyi"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0E68B1F000FF;
	Tue, 29 Sep 2026 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683878;
	bh=AWkymJQyJ/uFUerg5PWmzlppdMRAJIa/vuVE9EYM3Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rz8fyWyiHtk8piNl6XYaHxIQ2ZEC0vxoTooIdd9n9+uvnDY87nkd0dZbStVakMZ4g
	 dJ8tKTtt84mWcg80ePX5K7qKcvnzMSv9AGsUlr58Ohm4vr9uOjqCwE030OPWfUGyNi
	 Tlz5y/eh3dyprLqdB44NGqAGNc9pDNWqh2zxdj47OReU/L0/eYtkAlGJYRvll7gmLD
	 bH3G+Sp1T7jqaONHYnya4UPmkoOXA3GmxV1/eEEp+FqMXSlsZ/wlYatJo6hv84Uagi
	 EWMDfEk/aDd2qZdyu7+f7+mfMJinU2X0E+6kqyMpsffOK0/ITz0xq4IGDSwsulvN2P
	 2ssqxt0puzXbw==
Date: Tue, 29 Sep 2026 14:10:16 +0200
From: Nicolas Schier <nsc@kernel.org>
To: omer zalman <omerzalman42@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: keep builtin precedence with duplicate fragment
 entries
Message-ID: <aruqqBsCXEhO1pTN@levanger>
Mail-Followup-To: omer zalman <omerzalman42@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <CAGLNFZcFDMD7P3rwueV4eRQ4qvDU4ekyzLmYTFq==5fUZxMBmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLNFZcFDMD7P3rwueV4eRQ4qvDU4ekyzLmYTFq==5fUZxMBmw@mail.gmail.com>

On Mon, Sep 28, 2026 at 07:45:22PM -0400, omer zalman wrote:
> The -y option is meant to preserve a builtin value when a fragment
> requests a module. With duplicate CONFIG_FOO=m lines, only the last
> fragment line is skipped; an earlier one remains after CONFIG_FOO=y.
> Kconfig reads the later assignment and can demote the symbol. Track
> the symbol instead of one line, and skip all of its assignments
> when builtin precedence applies.
> 
> Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
> 
> The exact git-format-patch file is attached because Gmail's web
> composer removes tabs from inline diffs.

I did not have time for review, yet; just a heads-up:  Sending patches
via attachments is incompatible to standard tooling (b4, etc.) and thus
requires more manual work.  One way to work-around gmails restrictions
might be the use of b4's web-submission endpoint:

https://b4.docs.kernel.org/en/latest/contributor/send.html#authenticating-with-the-web-submission-endpoint

-- 
Nicolas
