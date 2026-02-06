Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585782848A8;
	Fri,  6 Feb 2026 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770381743; cv=none; b=MBvk8MuS/IitTbPGkG1aH6k/CdrFaZk/VTwYv9D2jZQSuflmBb1dsZvQhqJj9u48jdiBw6foa2JU7LGvvc9zZmEThYpbuUHrE0QA7yzkdmT2oBmmjYLA3/48ewqcRPonfD+rUgQyypsXj2YWp0dxLSgaDgmwuTux3C3chzGeni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770381743; c=relaxed/simple;
	bh=DBcnb3P8/rQFglLN+omDWj9BCzQTPUCW5QGfGdd5Gmg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UhGJy3XFQSTwNrFdRyqkncSW4hanANWTLdAr5AfBWO8m4J7+4GqW+xHU/T9hhsFBrn7OuJZ1bN6yBtBg6qnUffKxPQudENL5b5myNoQ3CN4kNEjpuC2L6eajrwJgADUdUmyl2RESnQ0Uy6LacHhy0i4BVZqNjrO2dZQVBFFUd8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from [192.168.1.209] (unknown [27.19.236.155])
	by APP-05 (Coremail) with SMTP id zQCowAAXqg2R4YVpPGybBw--.288S2;
	Fri, 06 Feb 2026 20:41:54 +0800 (CST)
Message-ID: <c1e37734-271f-440d-a391-91e958aa89ad@isrc.iscas.ac.cn>
Date: Fri, 6 Feb 2026 20:41:53 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: xinrui.riscv@isrc.iscas.ac.cn, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
 Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Jason Montleon <jmontleo@redhat.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Nathan Chancellor <nathan@kernel.org>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-2-2ac86ba728c8@isrc.iscas.ac.cn>
 <20260129224029.GB844102@ax162>
Content-Language: en-US
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260129224029.GB844102@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowAAXqg2R4YVpPGybBw--.288S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw43Jw1UZF4UtF17Kw4fGrg_yoW3uFc_Xw
	n2qw4qkF47W39Ik3W3Kr4fJrZrtFW7uryrXryxtrZrW348KFZ3Wa15Gr98t3WSg3yrKFsx
	Jrs0vr40kw42kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7sRiuWl3UUUUU==
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/

On 1/30/26 06:40, Nathan Chancellor wrote:

> This might read a little better if it were
> 
>    scripts/Makefile.rust is included ..., so we perform ...
> 
> instead of
> 
>    Because ..., we perform ...
> 
> or at the very least reversing the phrases
> 
>    We perform ... because ...
> 
> But that could just be personal preference.

I think you're right. Since I'm not a native English speaker, some of my 
phrasing might not sound quite natural.

However, considering this isn't really a big deal, I'd prefer to skip 
submitting a new patch to fix it. Unlike GitHub, I'm concerned that a 
new patch might make too much noise on the mailing list and interrupt 
the thread.

Or if someone could help modify it when merging this patch, that would 
be better! I've read the docs, and the kernel tree seems to allow this 
practice.

Best regards,
Asuna

