Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EECF36B927
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989469; cv=none; b=R8ANHyOmpbyFv+pmjhNZohee40hO5GX86nJ6MHno/DmcgT7cbIFa6UqjUClPh7Zg/eUG1eqeHZgN0JdBZ77W1DDSKrR9FHgPg9hxxLzWn/cS655HKzkZzPh/W0ViGVmM793IAhJyKjpxmNkGiAw8KIMJskAMsHfLgvgc9pXm/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989469; c=relaxed/simple;
	bh=UGeCbHlWoUrPihPSuPP7/nRq3OBVNxZ/+WecCtx2m8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2BWZm4XTLcvYwC9Jhq19eyh18rPqU61p0TEAWBW2UNiD1kKidiR8FXPBBwhqd116f7TQqsJOHnKsRe/5WU2oow3yGPqG9toWt+8Z+iUJj6ComAI9Y9vp4QtkdwYSWcaYNwJ3+YXAE3Gj9X6DoaIzKiUR6w83YRLLA5sHF4yP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN1H4Sgv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN1H4Sgv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c411d6615so3097003f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791989466; x=1792594266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFvjSQRh3A/XQC7Xbty1pFGQXBuDdUgjTrl6Iafg+nY=;
        b=GN1H4Sgv9bxWMTLBm7BF4Th9vbbL/dhV3wzpmYtG6TtHuTVTKJFakwmG1tRBPeXBzZ
         SiV7L+zIv9+zBm3VH9MsGdoxO+F0tbZtr1ALEv+Y8zKKqwUmsXraO61MtnuG90es5H/7
         MiCwEALFLWPUErVtpdUlKeqlkZkHEMXG9DobOj5BLMGJGU3Eefwnrt8tJzIh7TkpSUjh
         QWlJyhOH3IQG6bKNN2Fwcu5UV36M68DbeKSXG0BAZnfXMA5SY3f2+zGM/8TAaP/ctizn
         yCtiZLTCUEuWcdevdRzLVuV4Sp7F4QfmF8vBCcSCEFCD0C7KcBy2ixrkXpqdEhXwEQF4
         bCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989466; x=1792594266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vFvjSQRh3A/XQC7Xbty1pFGQXBuDdUgjTrl6Iafg+nY=;
        b=2wBCyefLlu3e2hiHMpcqC1P5vSPA8eaPeDk/JIWjcqU1U3ry1VkxL/cWsJr4FkvIkU
         an85oj+QdkPbWKZ8MEGP8fSzyxKWWXcEe0hOlpabCExlN9KDl4fdhpzOAbMQVoostGsU
         TY1InVIlIdDFdjWQSt3PLre00oorct74fTg1xzIMajUcnN+M/uYCA5NUQiT0+O28BCA7
         r3AQ9VzhhUWgZHEUQij4eBsBa8FsDhPS1rPM9qdEFUyKS58bdvxVS8QVk2MmfUM4zyZ1
         zg+9wUb285LQXoS7Fru+tJkxh5QZ6ccUmNbMeefwIP6XJid/W2zuCoHOPc/GDubRNnvF
         +OLw==
X-Gm-Message-State: AFq9FYIOWpIa7z9Di5SRfzQ9x4EPADw8Uxah8SBmCHUdVvdpj4lT9Vrb
	cNvZR9eVwFp7CX3pX2M9n6m6ZBj9q/YB2ybWifsd3SXBQUBB3of43mbP
X-Gm-Gg: AYBFou1GmIeJ9xCp0+ToOZrQRconlIvCkEAs4ZhgQnOwJg3E2nyfGYQd34f3Z8l844A
	KxpZvKfca9QP+psZIDMIG8UsJS+gymJD8/3wCpqJKq4HEXIkPR2q8xWXWtlc1NjLXJxZHB+4/NX
	aP6zcikbkInmNNvu4008K1iFI7pCHON1BwqJyVrCmRW6SF5tlHYQDqMOntF98LKHKkWvTNHBf+W
	IxGz2LJ73yaa41nqvpTo3q3LcPWRvVovufLuk3ewJ0a5sjXp1H2Tpn37fFwvRBLqNGckXTF2zMR
	P7DpcqMWmXSkvMmhGQ8G6cgLNrJQzK+eASfYiSLlAjYu9/cGq2SzBhawMrHoMXADZnGE7pzUpGt
	Kub63HWA+YVQeQCQotpwWcHm8STpMKERyJUiivdiv2pVj4tYXKKV0A9eiVp1MnTT7KS63hXzgB0
	fiZdYk8Yn0qAsAkMb3bpLG6h6FqQbCiGocpRPq2i0ex2333P4efnwbgbqCNb22AtNffakVMpA2X
	9xGcOnxcOv3y2Xn/DebA0/yj5NPj3ttCGxgPO0XdsYgW5iAkdi7dSEFK+G+9yzZ0A==
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18e4b583fmr320053565e9.22.1791989465509;
        Wed, 14 Oct 2026 07:51:05 -0700 (PDT)
Received: from [192.168.1.28] (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm30545e9.1.2026.10.14.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:51:05 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <95cb289c-384d-495e-91d4-bd7dd4d2a12a@gmail.com>
Date: Wed, 14 Oct 2026 15:51:03 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: fix use-after-free when a variable refers to
 itself
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164504.3683811-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164504.3683811-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 17:45, Leizhen Zhang wrote:
> For a simply expanded variable, variable_add() frees the old value of an
> existing variable (or allocates a new variable with an uninitialized
> value) before expanding the right-hand side. If the right-hand side
> refers to the variable itself, which is a common idiom in Makefiles,
> e.g.
> 
>   X := 1
>   X := $(X) 2
> 
> the expansion reads the freed (or uninitialized) value. With ASan this
> is reported as a heap-use-after-free, or a SEGV if X was undefined.
> Without ASan, X silently ends up as " 2" instead of "1 2".
> 
> Expand the right-hand side before updating the variable, initialize the
> value of a newly created variable, and only free the old value when it
> is actually replaced. Add a test case for this.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: 1175c02506ff ("kconfig: support simply expanded variable")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
