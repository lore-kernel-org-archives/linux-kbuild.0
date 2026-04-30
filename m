Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1D1C860A;
	Thu, 30 Apr 2026 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508611; cv=none; b=EEES0OIwwjN53JDFKIYOiTgrhksnUsSm74ws5LMQz9vRnn/yyFxWv0XNbS8csP3VI5/fqPRql4BWKd/1luNVTcRpX++hDoeYUQB6I95n7Ax60N+AJC/oT+OzoLiZww+eGKzkYWc2O1zEFwuMuj41sR+0yuLYBbe3XwEU5BBLrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508611; c=relaxed/simple;
	bh=tMmLI+M4xTg5aEu2x9FZ0KJuW3zlTf8lGx6f4RDFF/Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NrtkFPLBIXTfB2iTWwLjGWp3kEgVCNy3fLcu+ccFaODei6rnW+GyTEHZvr3pyZwskTX9XdRC8yViA4TmhPxzybO6g8GZNiv95FlVL7az2zod4jTtYnIyL9qE/7xYZTAuCnXyFxMj0KVISOYmcHp5OaUWO2BM63A9CUupr3U8h0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEBS6LPA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEBS6LPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFFBC2BCB3;
	Thu, 30 Apr 2026 00:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777508611;
	bh=tMmLI+M4xTg5aEu2x9FZ0KJuW3zlTf8lGx6f4RDFF/Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=QEBS6LPAqtN42wwcIENnmgQ82rbduRQaEKjPmMVuPhbQLOWh8al0hhLZHzWZqPPu1
	 232ESyMPTeJKSGYpVdIhj3l6LTsMudnhWr3gZwnIi1hmAgJHHNppsCv35xVSMKbMbw
	 /j++5zqQseYmfn8BXUIn+PxIfKYc1v9mt5mt31iJgRrE9bkKWRHdCJiFzXeZOaloU0
	 PjsI4i7/k2Gw/i2uNd2iMz4eDzp7ojJ40h6yQB5B5XywsFYw/bMlxLqyVDWDPgoFyg
	 8sdV54DLGDybxjuZfFG+CKRfheEENnqqWY+3sjNFgPGY6GWFC1PLyo8vzwRzBGNlH4
	 1QezyfkNGweHQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 02/15] scripts/sbom: integrate script in make
 process
From: Nathan Chancellor <nathan@kernel.org>
To: Luis <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, 
 maximilian.huber@tngtech.com
In-Reply-To: <20260410212255.9883-3-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
 <20260410212255.9883-3-luis.augenstein@tngtech.com>
Date: Wed, 29 Apr 2026 17:23:15 -0700
Message-Id: <177750859587.2042162.2970973765684454502.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=210; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tMmLI+M4xTg5aEu2x9FZ0KJuW3zlTf8lGx6f4RDFF/Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfFvxjjthcJFFr8iW8Q3sOd6F07+fFgofS/W6LL9T6L
 9vMkbO9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzERJWRYdUl9yPabjxcYXMS
 A6e8iPE+n8OWlOZ88sDX9NQ9F38+/cbIcMou4Oh90T3iK3N9TwTVLNum/+B9liar4N32YDYX04Q
 UFgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Fri, 10 Apr 2026 23:22:42 +0200, Luis <luis.augenstein@tngtech.com> wrote:
> integrate SBOM script into the kernel build process.

Acked-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

