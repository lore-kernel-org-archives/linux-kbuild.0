Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF0433E86
	for <linux-kbuild@vger.kernel.org>; Sat,  4 Jul 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181938; cv=none; b=MdwGX+ncymMoPSQBI5utRh9P5ukXSEhI9I0QMUI9/TDc6VqwW7Q+P6dJ75UStwOinjCb46O+Zz9bRpCzCY5VnYJLYO9mOO3FxVtXIk/ikeDD10erXIYPtbItL/8kv03RMXvMBKZmnPO16hIbXLyDtCpV/BKA7MN7JBtjMWSImiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181938; c=relaxed/simple;
	bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9gyVITHru53apact6E4FqaGRpX0MtHa8keYPYbpGPBrb5rcPbMZzXZ2a6+1Msu1E61IBmH2/lWa25mNPsOpN5zbtNo+Nm4YCraS84eNBKDps1fpp3mUXIKenW3u0j5I2lsssyWB/5Ot3arpazTu4B+TaB9aGRE141VnClnfyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddVMUWHV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddVMUWHV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so11526485e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Jul 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783181936; x=1783786736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
        b=ddVMUWHVQozUpfto9RfSqTTa+ozz+Eg+trAVcQrnauPflewqbshId2U14RmAYlF05s
         kgOQg6WD62tpwpqZYIQsyBNGJCJtTuVXzBheANT9g77jIQuHrWa3GMQqDAQIlcpqKbeQ
         l2HmpUVCm1nWQox3zgIFc2x8+Av3SBBUqh9nMU2/9F6ng9/9MsJ3oh/efS2GCf/fIZFu
         0QiLOORRHw0g2ICJ/uixCUE9ATAV5u/kIpCPu2fgn/KNb9STQj3eW9WWDETLMhFK8iSB
         lDxyQq3f50yS4lMYRxR6ELhvlhBSyoquk3UME5jIiksb1oObqeuIuxfnG1mMBjAmdmQM
         4ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783181936; x=1783786736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vdVZwX1pjzyNDRqIV+N7mx+yu4U0xEenr907aAJhxE=;
        b=nBQ+hYY0WoJVXswEZ9WNA9IFyoIk+qNvzKE9aZaFtvWY0e0TxV9g6YT6dY4VTVhBht
         WVeatq+bVTRCtDqKYs632bJWWMK0CljHdaUNc2NId2C+8qOUpcsyT9AovW6uf6UOYV3e
         egKHAsBJw+1OuefZdzCRl3hEx7WpE1NN5LwUx8zas0GqO6hAtUUF9QnNCuFBZuU9PhB7
         A9Jht+5U9BtOg6qDocZ4PdblL55HBAlHrdB3iXELy7i8TdO6AbngHElR2lNueUZfDifH
         V9NJ/i4aMUpboEoTyvT0wmedw1Oe5MS1g5CvO7eSm8Zru5UbYRhSE9DnFfBsZl485PPL
         yx0Q==
X-Gm-Message-State: AOJu0YyDr5J+Hh4UCD0MEuWSgpAH/ynoEZIHFhb7TIT71fyaV376sdof
	/ic4ij6uq6JXUdndvZ30IgShLVcmfD0jIF7NTs6mdlLHqVgsMc2WN5xg
X-Gm-Gg: AfdE7ckXgADKo3Ydi/hTfVT6G8EqUpPi4RMAr2BGX9D0O6cIKiAjuLWrADTUJrtFFRE
	KPlRkUwIGJAGGvA4GqQ4vViTDmOiFQ8zNFCa0TQ3zXVtTbk4FdMEIs3jJbBZ4XJSiIGoKkX9ZXS
	koAKZ/s9kDI2V9CQR5swEmkYvLazrCO5DGu2HAVYdftqptHoVeCIIMYOnwHsMdgOpWszfywhZpR
	dcy6fGwNzj6aURYEOERAaTw8AJi7FvTrMpwCy9mfiDc2r7kaJ7j1gd2I2dsOilalpry8afV1xoS
	itYS1eb5v0klvelzdBSY/AlcRkBygGiIlq5TGrn2GXgHCFeiUQzJLmv7tXL70i8C0EDV1+cbQ+Y
	Rbvh+3LTjlza07lcmNQ0FCG8PHcURzu1giCl/uaSaFYkZK2Z3YTD68KjWk8E9KIaRghLqKn6E+Y
	rLxQ72R2SoiEuu7SN8ZKqa8tNE4/aldHR6p0HfxXgkTWGOxH1qpsQtpE1XqI2Vkg0I+JYkmsmZ9
	sB4jyGBdd19oTCo1nJHYRE=
X-Received: by 2002:a05:600c:154c:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493d1d33cfcmr37542735e9.33.1783181935580;
        Sat, 04 Jul 2026 09:18:55 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:c6ed:7d0d:2285:7b33? ([2001:8a0:e962:d100:c6ed:7d0d:2285:7b33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm229210135e9.13.2026.07.04.09.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 09:18:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <cbc65656-98fc-401c-8095-835d23884960@gmail.com>
Date: Sat, 4 Jul 2026 17:18:53 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
To: Arnd Bergmann <arnd@arndb.de>, Graham Roff <grahamr@qti.qualcomm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
 <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
 <7e20408b-3a0d-46ff-ab6c-2b0d86f74adc@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <7e20408b-3a0d-46ff-ab6c-2b0d86f74adc@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/26 16:33, Arnd Bergmann wrote:
> The difference is that a plain 'depends on BAR' does not
> allow FOO=m with BAR=n.

Of course, that makes perfect sense. Thank you, Arnd!

- Julian Braha
