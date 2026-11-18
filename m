Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995878;
	b=R6WFTjkfBEEfH74poEpi+qEwp3TN73X/Sjxhdppq8cG2u573Nd/bbM6traLAgVXyWNMC
	 ymNUgRP7YOINXWeXJPAtoSghObmfkyuzN3ZjjeuJsyUOXHA1YXRw00+TJ5gMbh+iX9nHL
	 nUnIXJxwa5ssW+DzFtz56qlgPieI9MCklJaeOSghkwS74296nxGf48aDkK7YBxGGEeqgb
	 3vrMtAQLIS74y74Mtl1nNtYR59Uvs9eq53W05nWHvRuNgNhOKkq+iVKpoCJpECRmIGNaW
	 GOBj32PLdnOShUnj52lIH/gNr82AUlQnwE9xVMEKsqQWq6HzCjmo59xyKoicj63GZcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
	b=I+/xKw/Bcaze1Z+Us4yeRVMav9kCoR8tkEozNkRWjVMhO3JAKZKx9cyg/GfZQNXi9JQU
	 w4rQjrgx14qlk1OTZc2UJrs94cdivkoUlmYvuhllTqNOGkSn7TbLrzHFdoK/Huwh2tRbk
	 oeog1IxhG3lI2HYclHvWAkVFL/dyL6dYkuGAAvFRjNDLBN7lIk7V56O5DyzcqhezvvOEp
	 4/UyBVqZKajf6E8dTM5U1zBgR645gSrszvP+xaFS5IMFMWq016pde/SuvBDeAZgz7zM8Z
	 np2HArnT/qoSBYH04mdb/b5h3FFg7L8MlaU2CXEmpP04dhXipLKfKDCWWjjsvZRyOlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05277606A31C
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05277606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6895015e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 01:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995876; cv=none;
        d=google.com; s=arc-20260327;
        b=MAeN6fwV2mCj3UybA9IP0Yn4zbfz5dkEYkVp1QGIURIaBzIafdnSaApzyqpmeAJi9K
         +yt/U7oK9Bz7gAKt+3ugHxnIZJbmNRW9wUI65ETnwjS/R2KjnJxLx8W7tyuf9llcLfr4
         FbSYRUgpzGOKvuJnDcOJ5aK3s8RRstqshMWnnnvWWer12qxGUQFCFBxwCjAAqBMioouA
         DwL3rpsN0fm5c3UPMzBqvsJ4+yNmXZRT2+YTnfM2u45fMyXmKFMF8xEZ/ubfZ1K1z90X
         jE5gf56a8uQnYDY5mtYxXZJ7+r2Qfgy6cNyeX5bvklfL2Cjuf2HOnmq3RmG8/HnzGnVv
         KvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        fh=4ndG0U+hIHFiJy2iAOGnYpj1VDYrnBw0S0stiE0jAfc=;
        b=RHexjJMwkYCGBFyYonteF8lyDKFpZTLkjI8ta0waAndycQF9/OwDwzkeR56hU5Wicz
         +9Gyc/eDTxtHOC/HlOPBGp4Nce3G8f2QVHK6nh3vEm3pnvV3WeL5NjqjC6RoE+ZHvpqB
         n6MoeHycXAEKJ+evsV727nT36uUqlPOtJZ9HNk/cxrqvaypEAxgUtjookFbwIoxYsnYL
         1ivUkSnwkvFLlvP7PkKRNp8PxAxuiY+BbD0T3P/9DwUpvKf5K9TzosSk335H18ie7SZ/
         TrOsTDKIvDgE4WeSTcmvdTJUKSNIVTMN0/fl39FBox4xC1UCf7J/IFJaXHhWQpcqfZ0i
         Gl4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995876; x=1795600676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=THEBCTkhDaIj9RmoNF4LMTOL9oowM3Y4L++ejGG0swuE5SWcqzZ3Fm0cbNnMT7gQX/
         lFsXGvsSx0fTnTECCMqkdycImYjidmXHi35LTyCR5gd8zhuDXSk5OQ9CQyGDd3Ae9nAL
         zS3gzc5DJ0QGeC+Ri05xWzzrJjiUrGOE3el+1F4665cKmTz//DnelXie8/5O24xGomdg
         3uIGkrxSDGEee98W2JoQix1x80x/+wu9HBtUJ7WzYlJQ90JLeIhpkGy1Pht8KuleFUyA
         uApyHEi+/6pmXmByHQ/OZKiTcWMluPP7FXxcyIv+NSl1/PyIzybhD7BPMIwgYPnMnpmA
         XW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995876; x=1795600676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=CEIaXILVCEG8Y4NB6qhPi0Il6lFHm5Wy9x+cFAyQZ2GSBCOWBl7hOVW9QgwQ6ksa/T
         dbiRlP7ySV+BW3sIwsh6WZqqjlUBCEFa5gUpK2l9xmbDc+Eg8YXHWb25XMslRRh0NqMC
         Gy+Vx9Shp0elhqnETZhp+mj1PMOVMhLvpSpDT24POnxpOVFJGQHHIIMi0t3xT7zHJW1u
         rtcH7ybU+rfSSJoAozpce+DpTE01htfP6znLe7a2qmTvV32xQeIWIBqQe2HTjxqulWOq
         h5r724yIq5GmWB/Ob5EnhazkP030KPw0J49atBBUdUS1qtm3azCd6F1LjKz5Mwt0Usjp
         k+ZA==
X-Forwarded-Encrypted: i=1; AL+hErGCAzw4HQ+bf0tCBICUeemkBSWlOwzYPcLKggA3p8NRtN0QhsXL5nGH8p1ALbd3hEyniRUVLGsj5pjC5MQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uelGT7HFUOmNGDaJWo2LfQsGTvt8+x7RsEkjYBjhMRw1j9y2C
	oxbiR+W2etm+DqzChgt/ngbE1SOT3xxG2u9TLcXTcl+4j2hwHfC5omqjbiuFEVSWHtTgOp28DxC
	LEHHATIBpM7G1NNg12yBmn48cgKilV1g94Mc0RS8v
X-Gm-Gg: AYBFou06qmNrHmsaIZsDbC0b1+8M9a3ieulZikqoEh/MivRyGkjeCdDz4g+AuJa1MTm
	ZHL2963bDjAUZU2wbMotWQCxss+P3F9XqnADomXhCQQvPDhbO1s1r6//AClgLHQGN0kq2cX0R7J
	nvnIM2/vvcx48vziCpf1S+GbsXhKLZ/EHvPY3SGxjMkheVyCdSdtiKV9SyfEYO+yQcIPRNQP56c
	bkZl8YhRUcObGI5b5QhoIARCQccW0g7FdCI2zBMRaXm2nLjdnKTtrxC/WCamGp4s1hDdX2gHzfd
	C5qdnfhNS8KVbyWFkzhut4T+wBmRsZWsz0FbE/NTKEPFCf+U1H6OmJuPT8jhzJ1GSg8ilLknq4f
	75+ZRdZ88HaFc06FQrxRUx0sYKMGEHgw0PuqkJj+b8sSVA50NPSbon7ubteqoifsyCvOODO9I8G
	lue3dOJT7T/aBISGPIz8TYSLmlNaar3Q==
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id
 5b1f17b1804b1-4bb7d9fb3e1mr33299535e9.10.1794995875720; Wed, 18 Nov 2026
 01:57:55 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
In-Reply-To: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 10:57:43 +0100
X-Gm-Features: Aa3M54owhO-6y_6OcVgrrG5ngHvNLszf1Fezq3bAT0KDUQTiMvc4EQOCOXnAIEg
Message-ID: <CAH5fLggoZNruFqpXsUP+rUP7L3g252Mvs+_=A01w7NiBBfT+bA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:03=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Sounds reasonable to me. Although, I assume this is only really a
> problem if the functions stop being merged later on, e.g. because
> they're no longer ABI compatible?

They take pointers to different things, so the one that got merged
definitely got the wrong CRC. They do not have the same signature.

Alice
