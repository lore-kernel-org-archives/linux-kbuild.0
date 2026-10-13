Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24238B15E;
	Tue, 13 Oct 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876567; cv=none; b=SlR08GbAV0VpUPjP3O2Fhn0fs0YUVOpS685w01V5QpIYYddPe96f4w70fkYYg4cYJwyAcV5H1QLAp/r1v+8KRKmdTh5wX7wH13iFuu6YXAbBAozNEeps2OhnC1lGJT7DxVy8wc73bSlwAZStWbcLSGNEf+O5o9am8sV5TirLjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876567; c=relaxed/simple;
	bh=oG4lqtwBkfyR2317DRMffLj4KpnyiQBXP1v24zLv/14=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NWdZPV0jUKn1odrqSQ1LKrOWRZy3+MnPXN43BxmZX9Ell0WrAhQ4p7EDGTf28Q4GRuDNEijE4x0iH/HsaKv6UoWVNYyFev43jaZMpQZUdC10uJTanndanBHZ88BiRohq4ffGb4hrn+WCDEt05q6UpHogP/+SyW5kLnzDOd742n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTOO5oCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTOO5oCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036801F000FF;
	Tue, 13 Oct 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876566;
	bh=Gk5nJJYLLN6TEUeFXlo4nsd+h35WVRs1R3Hr2cZ7fx8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZTOO5oCEPQHf/nn8p3PJQLVShFPlmUC2/ASGOQ9SAz/YSyb2icBG2ToGnUGRfdzNN
	 Icnbo5Ki0+S6w1HP9GKAE51xDn2YnPfVhdBv6O+ieNinlBz/pjFVqTGEIh3cIlYZRp
	 7CN1pxSk1Vb0eNxJRzSSld1wZyXUsUQKP/1pz859wiKJwQmWqMwvf1VjpEK+JLAf5K
	 c5pk3R1ZQzssWGIr1pZpxpcEWmDec/pxxg0/kkqk3fnofX12OBtyu1dCc9/rNUUyBM
	 tpsQyMBdkxBdr0lDjWqTFh1m5y6GDz26+X3C0PW6wmcA7mreHTphkC2rEpaaNRaMNO
	 MrydmUO0rmL7w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] kbuild: Convert %.dtb(o) targets to single
 target rules
From: Nicolas Schier <nsc@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-dtb-dirs-v3-v3-1-b3ab32b64fa6@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
 <20261007-dtb-dirs-v3-v3-1-b3ab32b64fa6@kernel.org>
Date: Tue, 13 Oct 2026 09:29:14 +0200
Message-Id: <179187655459.507775.803901339545777227.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=511; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=oG4lqtwBkfyR2317DRMffLj4KpnyiQBXP1v24zLv/14=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqzd3LYB43fneDEs6ns3NqfHj5MfeehFyiVqRox
 NIxlJncaVmJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCas3dywAKCRAHUgpwFiYS
 aQHMD/997HcHrw33WegWs9oUuwDj0QiorA76pvBqCp2pAVkWff1LWsPkShl340ehiPZHsUFfRnN
 FFOrps8nu0+kRRMKiAWyRIx8a6vlnQVj9jVWDMv7gwUjCKgqdP1m8+Nh6TfGNNAERlZc/RoXP3r
 s25RCN7z4nug/nBTUMKDGh0h6ysM5tCON7wcCzAQmYYW73M/qYGGcGwJjBHr6PIX9VyMbZfIhkK
 quBUbpJ9G3KS7KCkkXaqF8fgqqTjUFi3WQur9OzLw4NSQ9yhhMM9wb02AoZCoDVZxz9r5phhAjV
 r1B0sqRcqxMT7U5t6vxLW7t/AR65saCe/xDZUW+5wquIgL+g6fUMrnpgDoZBcLbx7LE+19aAK/n
 5Twm9UaRALuUKtTH7NKL5ylRqXh10jnmGIoHth/c36vdoNH/cMZiReMler4UCSSYEtmnMpVUg49
 lVbr8D6ZLMIHkj4hJoTSGKRM5r2piYFLG/Fh4tSm/9AFUCwKURhl/i/kGHunjNukllg5lzuo0rA
 QzZc3TkjGTde5+7iiHN9E1XTs4qpwyTx5tNMUhjKOQg/i4bZcQDrni/oVxJPQ8eySGWD9zSnTJ/
 UNOU8dlu1vGhkA83HwQcTUHKeZd5gegIt6GNXu50Pa3ndvrlb5h+bj7ibNdR4r5l9Mik0ojPuzD
 wLr6nctGRZSsQfQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 07 Oct 2026 13:39:40 -0500, Rob Herring (Arm) <robh@kernel.org> wrote:
> Single .dtb and .dtbo targets can be built using the existing kbuild
> single target infrastructure. The only difference is the custom rules
> work on a relative path under the arch dts directory, so we have to
> fixup the path for the single targets.
> 
> With this both relative and full paths work:
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

