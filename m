Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377542;
	b=SH4K5EiqVMUWEvRnnUEBTH9ritYp7W8au2yS2oKzHl7QnTIuGN9WggFzNmxx0h6HQ6Nb
	 /jP+bZCu7EYtb6WFqDjeJ4yt3ks77FM6zUj699EtWxywMsOR0aLgXWgkZChzuuZtoh7Eb
	 qs9fMQe5I9vmUhSeoMNqohBwwer8fdqcY17wVbcjpaWPdcFOoWXKnDgpwDSM5LgAVuz/I
	 weO8aD4MSgBvAoVaWBkymRQ0XlLHHpiNkBWu92gUTkJ9oiqr06VSzEtOlGoUvWoLITI3H
	 ii04sO8Pf2xsoCc/sI9I6tFezznVsbwVTa3fdGVcR0T1r7GU8s77A1g/LXE+w0Vwq+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377542;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1PgfEZYU2k/hJzV7nu9en3op1UsCVSRT+CccB/q0ddY=;
	b=b12vtHa7VOQYwH4qobGXwMHlK7nOy0RL2iyNgqe/kqTPbpd0904uzMVS57Y2FXRWvMAi
	 pIZKOcB/2icerqW9yMjFO4MHM1G1gC/LQ27fDuG94Pn145Q3LjfWDaQczUxcr3jO0a09z
	 KInYQZOrGA8F97t10ttZMbicAnmIPops8CoBajldjaqPzofKRIZjQBxWYjXXBYfs6dQ1c
	 gLvgOGgD7gtMzbpg1jy2UDQex9VsLF5WIEr3Ltchs0cV0wZo8YNIHqAgXLISB8MlfZ0pD
	 o9R+kiGqovsDd6xoDh29cpzLJhDorlBEI6GAQi9S2L9nz+1r587GkBFLbJ0lqc2k3bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvGZ+UKV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6C606A320
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvGZ+UKV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72BE1F00A05;
	Wed, 11 Nov 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377542;
	bh=1PgfEZYU2k/hJzV7nu9en3op1UsCVSRT+CccB/q0ddY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VvGZ+UKVXXy2roswjIWXx1UjItP4Eqj7NbJkc6HzQkm1wtJVtO/KmbooxUuiBnm6I
	 3XKJOfUjzV8U0Zpz680DNyHncDg9OtitVKdJyb1t+z8khzijvIZI+CD9Q5e+37VsO6
	 kJgJcK6ACcHl7IJE2aaIuVsAi0PEtaoTwRlT0nJCY3UmMEonTt5pKGdpskCZw0hkU9
	 eg/XaeiCtq0s/CgAjHCD2txd58Lf8rvOxIzHA9bAqRfZFTjvJlbMltKtpn7dlCqHw2
	 bj29Th3x0MdHebYkRMiqQqjcsqT9PVRImbSOTVbA4TbLFhNt5qOz6nVgD7o1kyN3tq
	 pWtlV3/Rd0hWQ==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] scripts: syscall: require a complete ABI name match
From: Nathan Chancellor <nathan@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nathan@kernel.org, hamdy.aea@protonmail.com, nsc@kernel.org, 
 linux-kbuild@vger.kernel.org
In-Reply-To: <20261103164206.129733-1-info@daylightlinux.ch>
References: <20261103164206.129733-1-info@daylightlinux.ch>
Date: Wed, 11 Nov 2026 00:12:15 -0600
Message-Id: <179437753519.3770401.2951174633603486875.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=532; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3LakFH2Bjq+D1ShOFPCoe0OdLtoqJkd6QCLn5EHy/q4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlf2O1vpess32ExXUd2373j+wNvvCkTZu/UizkaumvPC
 7E1F2JFOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEQpcy/Pc4pvkg8GzyCneW
 m9lVIV1/GI3eLd7SVzD/e9jHSefDPJ4y/K9TZ7q0/+3t0yXf0w1XJm4PCFD5Zeo6iT9J6ueq6Vn
 T7/ACAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-11-03 17:42 +0100, Hamdy Abou El Anein wrote:
> From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
> 
> The --abis expression has no boundary after the ABI alternatives.
> Selecting common also selects common32 in a table containing both,
> which can include unwanted entries and inflate the syscall count.

These scripts are getting an overhaul and I think this bug is fixed as
part of that series:

  https://lore.kernel.org/20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com/

-- 
Cheers,
Nathan

