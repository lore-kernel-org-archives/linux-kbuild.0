Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EC3C73D7;
	Tue, 18 Aug 2026 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787079867; cv=none; b=OsZlY/y+W6bY66VzsYglbohWgO/sVcRino2Sxa8W1UDdhI/ItjGxFu5jP+kUmQO9GUjihlj/JzW1D1tpqPPaWGnpJSkDD5Ebf7wxJrxVn2DF5nTJnilPeXDsKMZGlq7HCzevPqshjuiw03TmiNjXj84Lmp5Hh8tS1m5L3BNxp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787079867; c=relaxed/simple;
	bh=p51NU5d2B/y0Fsl5B46e62rbcY0OzorlHmXP55rC6i8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=E+T0/UmnbLiGo+TTS2oZHxSf9ukyyBItMaFMlMaiHqGpjMTxOxAVL3zydDnhIKXVOSRAv44Xrk5GOuSsvml0lZxQywG3c1DFKasxJ9LyuE9jpmzPeiTGb3GKWJar3rENRr/4qzvkmCluabH7E+eJbgjC998uRnSJ4hXpODQByAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkVboWre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkVboWre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF761F000E9;
	Tue, 18 Aug 2026 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787079866;
	bh=lSRltDoIkJzy2L2/7VQfRY33lLf3maDRHH41hOYuh4E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NkVboWreIOLOXSgcGSUWQbhKaH/i+CmblurU6uHmP69hrn/fCcg8S0pc2f/mvfAtG
	 F6jP6+avV8rhYfN4pohqlQLZzRome7jHs1cXFn78QEu4+wzCUDcWNR9QqqjFWhlHaM
	 iJjvI+K0rZK/Q0lL9cxvtmvUFsGvPV1jrPGqyrINPbA8hnrTC6teekl2XegqGnmlK6
	 l0vXDx+BJsZ0w9/vfwWpdFMOeRGO2kRgNB/Aoq3gSvkYC9fWjD16qjcRz5D58PMOsm
	 Fu+j0xsxY+xPJ2x/UTL8VDlIuE7/IqIVb502oxgEHgJB43qFQ0XpOf5SQZ/1aDWAnc
	 0k+8pcwkrbYew==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: error out for recursive range
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, kees@kernel.org, 
 vegard.nossum@oracle.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816215354.1499059-1-julianbraha@gmail.com>
References: <20260816215354.1499059-1-julianbraha@gmail.com>
Date: Tue, 18 Aug 2026 12:04:18 -0700
Message-Id: <178707985863.2113250.4007818694470388435.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=nathan@kernel.org;
 h=from:subject:message-id; bh=p51NU5d2B/y0Fsl5B46e62rbcY0OzorlHmXP55rC6i8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkta7ZuXX0yOOHPkk9bP6zUVrPKqeg4tS7dvfrKYqn/i
 i0WHDztHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi3IsZGTbuqI7RKd/l7bv7
 ywM1CbbQRpYUnfiJf/LOz300a50C1xxGhtV3F6SV1J1l5/d+Up+or6l5Zs0d047WJ1+O3t77c/4
 lNx4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Currently, it is possible to create recursive ranges with Kconfig, such as:
> 
> config C
>   int "Enable C"
>   default 1
>   range A B
> 
> config A
>   int "Enable A"
>   default 2
>   range B C
> 
> config B
>   int "Enable B"
>   default 3
>   range A C
> 
> The current outcome of this example above, is that all 3 options are set to 2.
> There is currently no warning or error if a user attempts this.
> 
> Several attributes are already checked for recursion, including 'depends on',
> 'select', and 'imply', and we can extend this to 'range' for numeric options
> (int and hex types).
> 
> Recursive ranges are currently not used anywhere in the tree, so it is already
> safe to make this a hard error.

Thanks, this seems reasonable to me. The test passes in my environment
so it must be perfect, right? ;) I plan to pick this up for 7.4 once
7.3-rc1 is out.

-- 
Cheers,
Nathan

