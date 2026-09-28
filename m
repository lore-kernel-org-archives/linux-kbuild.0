Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EE3CAA31
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 23:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639263; cv=pass; b=DjhbAJCoFIDpeLu56UenrnJhqSkg3tvfkBhBAJUA8TEn9qKCldK3IQ3L6e4+RbXJl3+DpJkUZ7b1j0IOydVPBkmFWxIy4jHLkisHdwwNlxY8rXrZxUprc+rs07OjlgR1ECvHPaZTG20D2qechaWHLahsab23hE4QAJ+HkEAM+pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639263; c=relaxed/simple;
	bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=h/SawhFK5HQPSebeyi8EVutt2wfe7rJvmnFwlOpTErTvNr9LLnoKraDul+4oKcweoRj4Y9AE6J6IIP5bPM3ryyCLqAKhnQP4E6eiFNORCCSSW6WIC1I87RBdua111meHbEYuxYZSuuwK5ToB+y3qSQGlBk2LAZmsm8MTaQ8umic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz6RoUAH; arc=pass smtp.client-ip=74.125.230.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz6RoUAH"
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3a65e6eb500so19897311fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 16:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639260; cv=none;
        d=google.com; s=arc-20260327;
        b=H39UP3dBZ/STlcEI57yF72qnOSONZg+Kuifsf72K+PVtGKfj6d5EfHmsUB+8tMHj50
         xFugcI7SWIqiLQWfj4WuWrKCmsacMdqtd5n5zWKRlpKH2SPIlltaFJGj2wCoUDtcTwjG
         B0EJ6+Pibpji34aiun8uxvzQKUC/pTiBujar+r3pYgU3b54bbYzPyMFMl4TEVsKZHY83
         caRdWcU0rkkJLT8JLZ1GhQ9O7Ai4FiBhLfM0LWrG/YWZlaNK16om7e+2ifho2rxU4D+I
         UPgqB4XIFiQCjXT8d8RstGYZrOtdRn04cVinPTtkMBzsS9YGacDJTrek6LXkSzWO6UB+
         Skyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        fh=ppjZxV6wKUp38dvSrGnVC8J1BYFpVE/MUeZ2Gy05InI=;
        b=XgrxeDXgjRUjE7ZDOgG3OUTOpwTKRw6QxIs21fNcWGEk55DkSJE+3csHxfSRl7IN4q
         mBheV1ZEtJDg1XVpUx7jXy0RBUKBMorEk+VWhgrlR25rw44vkmdPOmqqdtaAtksQ0FKZ
         MTtuLJVnvfJ3k5jX/we8anQx5p0Z0rITut5Hxphz9bX2iv7w9dDkd2xPGsRocDf136BX
         ZgcZdPeNyIX+QBWZ+mwQ+tTABybUnKcgkXWjMfZ/z4tO0GkQPxJpf9k1Zjjs4WYLxwDS
         QwXTygIGt9HENJqv+Wj1HKyETfwhQu9sV6ikE5vUAYrGFtQRJgoQXgu7UG4HOxLpCSSq
         EOvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639260; x=1791244060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        b=fz6RoUAHtoNDXu0ZVxoNlWAQSYJdI41YsdJTIYtQfbUBeReH8wAieZS6+zpzT4Ol0o
         KBtc/LoC3RS99v866ewwLtfZ2XBHBEiGA90Rm6xKdm64zgJ9TAYfXdq9zsrLyyyLNLZy
         U7l3LSTJXkP2CyUzsYdL2aJuiUtci40Pk8HCSJEi95kvYSf3MIqhsa+FUdMZLh3EIX5r
         AQ43Wy9n0HT0QLovbA8IiojE55ixT5JPopRq0ixjHFPsgMBNVTff1GE3mhvHPA0totWh
         cREtWfyE4z/99oDi4oytmsvbG8MIvnW/L8C+LdHoqT2VpGVXBghtS+9kYzq/dFQKIw4v
         pEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639260; x=1791244060;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        b=Pr49a5OKAlFKL/xlBYuRBQ/7EUj7Kc/8QYduPk8pK+dfaZ6DEe68RPIrSSkQrUlcNY
         Vd5eNSQlj9BYYNCEdTfoy7PwT2PDq5AD0lV/tckmhO2tcn1sicr+sDOcDQuBNnLNvdx+
         mHEs4bP/G47oKtlMXvjLX6yHVqGsAo8CKSKpxO8B0HsgbK3iz+JLm8CUnyEE+0/61jdr
         XkAXlvLjqQjSj8Q6rT3o0F5r+iR2YjBTka6bQhuD6Vt7bfUquT2Hu73SCBCGNj1+wnoL
         A74ATvQ4XPmgfOnUE2hYK/AptOO4i0i8TX84u2ogmO4X5U1Hq3GTuaHyl9rmCjyIRZR0
         6kGg==
X-Forwarded-Encrypted: i=1; AKwUvBzXM33Jb9FU7udF48GZa3MWhJZcB2gASja+L9wIakX9y6KGdCW/3xmlZN+si8l1B9oVhoxd1efsBWQ8kcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK75Ou4q+lj1pX2Qh/dwKXEUE6nWkZ2bGW/Ho2KWbNG5LWY8G5m
	JHpehcosH+CF86IL5G/nlBcKhRmJEeI7oQmm/m6I9IkheqhRYkT/37NmOw1PwyUQRYPn5H+Gx8y
	rQIso1zl7tXtdN7tJIuz2cQshaRYOULEaAvaisje1Bg==
X-Gm-Gg: AYBFou2wqueDjWH4vInpoGs5zluBagZJn6/9yA5yZ8vBOPOrzmljBrDFtBGH97kd/SX
	9yfsllk1R2YuoQGynWjZKCtAj86c4m+4xaW6IdRVoLdSfOiYPb+1ZrNoyj/M8Ziz8rbwtyuv41l
	YsZ3aJIEJ4n5rsfABRcixz6znMP/5S7jEPV8LFES1EXoqceX+Cs/kEBEg94oc4XWuVWLYszFNom
	WgJCU69NxqMdnG1WGegHoh/GXFXMnKFpkRG+5JmGkqNwjHA+/cApnjGW/Fckg27R0oacNquBXVq
	17PDyu/qOQ1LN6M8vaMukF56/CYostz4GVtDekVVDOQgxFL95Cgd4Fm/wQgs1sE7Tn2cix55wpT
	2+c4Hji+6RvkZcG9aQwgAqGoqSnyC91ttaRVu8t5aOE70auQoapIUoXtxziUxQVKfKUKXb7o=
X-Received: by 2002:a05:651c:198d:b0:3a3:37fb:27b0 with SMTP id
 38308e7fff4ca-3a64c36f2d0mr23962831fa.0.1790639259996; Mon, 28 Sep 2026
 16:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:28 -0400
X-Gm-Features: AclHuK9nGhJoPEAHZ-3co23Vqbj9xA16t5iXDWsQ0pUYTlMrxqnt8R3HWm2WSbM
Message-ID: <CAGLNFZdmi91Sh7_51OWWq46ShYFcOE_GgNPoYzcvvSPWCDLY4Q@mail.gmail.com>
Subject: [RFC] scripts: should -d anchor compile-command input paths?
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In v7.3-rc4, gen_compile_commands.py accepts -d as the build directory,
but reading an absolute modules.order path from another working directory
tries to open a listed .mod file relative to the process directory. The
archive path has the same behavior for .cmd files. A small fixture fails
with FileNotFoundError despite the files existing under -d.

Should these paths be resolved relative to -d? I have a patch and a
fixture for both input types, but have not tried this invocation against
a real kernel build.
