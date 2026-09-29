Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0DD53B603;
	Tue, 29 Sep 2026 19:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712001; cv=none; b=YdRZeW+g3c1noZLPEQ6r8zPw9Bz37xA3XvLDTokP+4I8tZWJUfV0g+croBiAUtMaTtH1+Mgi+b0Kbuz8bkkdrcrXtF/+5Qxk8+/u6G3uXa3jH4M1iIzEdnO3btE0CM9AAP4XtEokCBIziNd9iIrxHM466fDJGVOCIk37AcFp+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712001; c=relaxed/simple;
	bh=BHZIDW5MC/I2vncUVsPMoybZl+cU4d/ASq3TG+iYXBw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=oD3H5dBn3AjWS+2wx9/s4ZLdwZShdHfLqSvLwzEoqCHUWsTAGLNtbSBIlrFGMgR0t2Cgu9xLcfpN4xrdDPBcDH2NESdFRGWcqsx0RDom5eB/FZ+vR53g9dYc4kLN4ZZ7bAjvI6/u4PG2cHqbxH9iKsj+Zx6+WKjcKZoDTKh6+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5pJq00c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5pJq00c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D761F000FF;
	Tue, 29 Sep 2026 19:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711999;
	bh=z2oa1OcDtqfJYCrJ3lsWN9bBLTjM9ok0eOwKjWlgV04=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=h5pJq00cLWLqy+pgZKxCIvZCY3qPuGjY1/niwFtITAHarht8XoCxt38A93iFfze2K
	 j/6mQNjxtXTwnxZ+8r/D9/uTtO0F/6gvLxx0u/N+qJwtTDSeXw27CnJ4DpVwz6Bqhu
	 wO6vzDmyFtu+OmSyqPqPBttuJBLqnNSdPW6YJXLofUpZ8Vw6cnXh1pnyXlSFXwN2e/
	 4UG0yvKI8MzJAGUJCg5GlwHyCaSruIv0rQMGKGCFeqVJ4L6C3PXavgt6kLIl0ghhD+
	 04TAgQBu8V5ZNinVlYFfDSZl+72XrPBhXLTlHSFNwTRf0pCL7+qjgcFyHE4+hI/lUo
	 j5r6qFIVudMyw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clang-tools: Import os for broken pipe handling
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?14=E4=BE=AF=E5=BB=B7=E7=BF=B0?= <ue081723@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
In-Reply-To: <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
References: <179017337986.52388.7943687183785012868@gmail.com>
 <179037565553.3985470.12035061965740287126.b4-reply@b4>
 <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
Date: Tue, 29 Sep 2026 21:59:52 +0200
Message-Id: <179071199261.2735405.15944114878466249879.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BHZIDW5MC/I2vncUVsPMoybZl+cU4d/ASq3TG+iYXBw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFl7JHbseRAdfN9mt5lyqF7J+VWJ7LaXot3uWN7d+8o21
 1vIf9KpjhIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRbAGG73E9M7KFOLuzv337
 5Hwhl0HlqpqSiPwWlQ5zHv+8rapPGBmuHbx57HS6rOeXhlumdzenbXG/ZrnswvSPf87+3HEr7ud
 WNgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-09-26 08:52 +0800, 14侯廷翰 wrote:
> From: Ting-Han Hou <ue081723@gmail.com>
> 
> The BrokenPipeError handler in run-clang-tools.py calls os.open() and
> os.dup2() without importing os. If this handler is reached, it raises
> NameError instead of redirecting stdout and exiting with status 1.
> 
> Import os so the handler can work as intended.
> 
> Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
> Assisted-by: LLM
> Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/clang-tools/run-clang-tools.py
> b/scripts/clang-tools/run-clang-tools.py

Your patch is mangled, so it cannot be applied (maybe you send it with a
different client from your v1?). Please resend properly.

-- 
Cheers,
Nathan

