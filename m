Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2D43DA5C
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494976; cv=pass; b=Ukg0MHmx4lRCaYLltECrbiMo5+1Kkk3e5/cMys4fAxWG2rO6YwqMjp1RLKGZAEz0MzQafX6h7dwOX26fHuMJ39ZQu1ZAekC594PsslGpdn4OhZFwyG5VXH2+F0DHhm2MOTKnZoqpjry8+Uxi81rE2+xzWd8zeHL4u3zzJ0XhOro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494976; c=relaxed/simple;
	bh=P7a2zFFMvnl7AMMV9J8HoSFvOnO26MuCDolXpy7oTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPqYqKuZKfgkmTosdfWQRTyVxe3BHPYZ1SbEojgFdQP73zFAQWvCjTI16FAMM7Q06aeOrYoBhZoWhx9HBVHLvUMnf/NM5z86F1NiYvFEAWjaNqI2heCwAYaXEQV1Lv6AL4M0vptj+s250q/p1ywMB2hR/xlJLO/m5D1SCnNpU5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a6KqVcGU; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a6KqVcGU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48586861639so537851f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494973; cv=none;
        d=google.com; s=arc-20260327;
        b=oLGB+OSi8aFpcVKV28p43mPpRIsvr0iHmya6GlrMz8fs4jZU+u8cujBwty1PxXLv1X
         QuEqeKjmGzAK491ANyBAHEehW6XM5gkdJdeuxEnVSDDVXaRUZBx+QDMomear1zuH14bv
         EScRJbYY83qFW+78+DvRla069aqEC54CGgZmZlUaUNF9+XinBNDTtuMbT05SjBFerGmy
         1eCQ1qCA66j+kzgdTmFnDMz9HPvf/ILfC9ftjAvQUxrVdVaF5YzLfSW8sMY0vPHh573K
         E2T/zRajEYEpCofmE3OywwmyEhKiA9hIIZG0RycJu26TCCzVJB+BwLAlacTwmTE88jGR
         WdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=Wp06ZaLJh8neV/faJP4NqhmQimoF/HoVhiKDD89yaXc=;
        b=nyfk7Wjvl0+S8Y4VFU0ZeYUJAfDOzddFKQ8d+SHHMybCMREE1T7HSNr8Hg+VRwqphe
         rI/1ZuwdBs7IbScG+djF80DZukZ/SEoU73I5O+YmM/Zm3CMu9KwEzFKKjVB2wN+cbmw9
         TzEC1EhaEYYK6L1L8UycfQ41A2cvToJxIh6JXB0eV0Frs799P9jQV5+EvnRMfN6YCEje
         zMcLIdL0+2OQJqkgCEGIkwlm5oAoyTkzFfIOWaoJfbDxmm2XIVoejIrZuF01JzdyTA9d
         YWyuIIpOte7xlJQTqghWkRKrQJPiWbKfI40kwBkB6UB/Y/OO4rL2lrND4KeInCZ9tqBT
         TQVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494973; x=1790099773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=a6KqVcGUw2fLFtF1Hm9cc5yrvLvRY7YxPEhLHNJIfcavwgt1rbW5yhhfaSMX9+BAED
         DGIeBSCgb1PlyB68lxCyUYa/zeD7s7Lo+A6Qmv93dYvmxfOjOqiT4T0+b7iIrlo89kl3
         YmXf3optvEP5cx8oa/c2vYZz/Cpd/9YBfStzMILEteq521PB7cv0n4n8ZyMgrCmgFcCE
         lMSUEJYprCL+/e4j6Ny2nYOmfUuoU2z79ZlpeYGa4QTjMUcNXGJrHFAK5pWg2+Dyb0Pk
         ebFFkqcbAhZKuXXO3iWlS5mmW4BKwKJfkzmb/CfloFnTWbyEEabpV3Xv4BxGONXxY8dZ
         5NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494973; x=1790099773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=Tj7Dp4pCYb9319BwRVxowjULS4lzvqD9RdUXs9c/+TS5d7Kwc/QJdW6zmHOIaFTB1p
         8njaWF88pkq7a5F5wfq0tsMndvsNLXOmY063rONwumyAZ+SGwT9qL0fxmgH8/vA079uN
         VbPzbzcPecBOwRcEGQTck+xh175552o74vVXFdW/8dpbHCrOPmSlKgwmsD7mNzRJIREb
         rYSkdr/zlLdpEkN3C+ejjN7+y2wLE1g8OK601o103bS6HbtslmjF/vvLTId7a6ZSxK+i
         T5C9W0ZoMabFdZ4AW25YpXlOsOvcsLAjmXAMI0Q5b2gyTdYt0Gglt4ZeWOKgGDVCeQ5c
         erEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5byOUTGiKU1lOlCdpN5S0A2+uFn+6VzsikmKZ+CYYEg9oMrEHwVcWCegpDI5ZL4oBszinsapwSUO4co0=@vger.kernel.org
X-Gm-Message-State: AFuF++kCUhwjIqo9rLwxx648U63fQID1/HTRhQkYJMWvXpu8zNkkGxg/
	btjUe8jOKfSO7nI147kLX1IVfHPcpnn4d4/LpBj0GQrVDZVv4VpSp+TCgMfkyjC99fpqBgH+BR5
	TUfyUCYon2ItKuSM40Y49ACoyROI7RiV8iipiONvU
X-Gm-Gg: AYBFou0WAvx5Y5DTVvgE1YuyJzTdPk8eQolFqsh36SKnTWcAkxFujfIiaMP7sPk4H4p
	qfLAWIoiEQZ7mNjJiBeKWHkN8TjFmKeIWdi3V2eCk7mrTa0+EDWbjwpmhaxPxH3lqWM6NRvN/D2
	j4l+XpfiS5DeSYJ9v7MzxjI/vN1XBvyQJh6v5T/nearrY1eLv+TC7+LmbJgqUbZlpkqIJcO9oVw
	LoyuD1eaZAhKGR6VS53tx2iIYElZ8QEieuIQ8FtrIRB8ryezMusA7P+/EEDCxUXIahdqSjDJQOn
	k48HL1cOlWOthQ3/Lxdscvx+qpea1ZerTz0wpJY6URFeUXNFQtHYjONzut2+RDALt4o+4OSjrqJ
	2BXmgJuYcSqhXbB20e5/XIqvevnMYYASVRJ4Z2PwBKYYEm3Xlr/4cUWAqki1oHB6gHHo=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > Module finalisation on allmodconfig builds consists of a large numb=
er of
> > > > very short-lived jobs, and the make job dispatcher cannot possibly =
dispatch
> > > > jobs fast enough.
> > >
> > > This "cannot possibly" sounds like a weird LLM language intensifier. =
I'd
> >
> > Again that's my writing actually, probably best to stop assuming LLM no=
w ;)
>
> Apologies; whatever the opposite of the Turing Test is, I have failed.
> :P The AIs are winning: humans are suspicious of each other now. :)

Is there a term for this yet?  Cylon paranoia?

--=20
Thanks,
~Nick Desaulniers
