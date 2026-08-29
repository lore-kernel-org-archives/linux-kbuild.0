Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD62DF156
	for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001321; cv=pass; b=Noog5my59JC6cbF5fRHe2Fywwks11SJcejrBENrrqgOQlzK47CRdUTS1fVfywIDsv2UR4yvoA9AXt6A20zkdV1bU7QVhqVqgKP0olxdMtb+4jeevSsgNP0X9sS9trqYmfG6QnZm/jDBlDx9JHt6BU1eFVlc4QYE8W4ogA3L2Al4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001321; c=relaxed/simple;
	bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMX2SPxYanrjGXDsonUOzuakh1j4rCYPMr6FyrMkpDUuJMq2BZ4HscLAJohqsWd4JttKHXbTYcxVQMe9gxcIoY12vhyIqzrsA4bqg6rHdtPQZwWCVDWwDoBJBVlCAmGVDu9eUsUNNYHwKmwhOVbWl94bJdc68B4oXUzrnkJmZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULY/4yEK; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULY/4yEK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8f2ed7bdcso466335ad.2
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2026 04:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001319; cv=none;
        d=google.com; s=arc-20260327;
        b=On6OEDG+Y4K0FRieMk8F4QabjFvLWoapWy6cPrpVP0AvfIZ1z5XIqQ+TgxbLFO2E7/
         1ur9pliW5G8br/6FV97jVhJ4BLsW0W+8AELi4a70bhNAn4sT1nLw9MgA2r0S9LgugKtZ
         MgBfX7MCHOXaonfqJjW1VnKWrqYmui8xFdxMTk58GxLH6+46m/vG60IP4qh5ffNqDovU
         BBhlwxrbRz84+efDAG8y5GYMvW1cbjs57uLNosHLmR8wZZHA4IXB+P6b7nURT1bxCQ1Q
         aq8Hsz2AQ6QbHaE1tKvWy9y7Nh45Ja2T7HzN1EqNEdjNridgCr62QnHdo5HUEtTU8BGq
         NYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        fh=dCYjFtPiepMWUyGXvAEcNh/296NP92ROwiXAO+d8e84=;
        b=i7skFCGJ7LT4vvdm/MdEuUtJNDyWopDSULscjiDAF1lID6dhx4s7dpXaMKP2NJSp7X
         KpdsgpvIa0Sr9wgMUUN6BQjKzaxgNQo/QS6SVSqRTv/h1wFfdjcQ59KUT1Rn61FU4heN
         pujliLNfTnfUCjrSZfudkl897VsZet6ZTkg8xZuGb+NYqCPlJKb3yAqQ3bY/x9QAcquH
         FaaDrDy96yscCr96Cp/kjUcFEVzQXgB3PrVo1s5BPONcvUWR3u/jj8X9amPyyYzH74fT
         drBUhry2g/hcxXaC/5fCGUqOgh2CkPcTnZQKaS7xo7ED3TihatKeOFk1V+X6dSSKnbFl
         9OVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001319; x=1788606119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=ULY/4yEK/OIiEqWn0gINn/0zr+jhfFt2Hmb7UdU5PhDYhCKiZ/XEyFVW0fzWgR83FF
         rgDVvp6gNTgymqikWmL5xLfNdE0/GAmAfWcf0zBKSqfcyg+GbtCPgseRu4mbTV+eeDw7
         w6hM1fMEVUUD1g2NgAyU5A6LX/1rUtFHxVssN8iciKkldDjtCRyqdaZMgu8ZI2nrZBli
         MfjO9Bg6za2Xqlz8j6liqXDJ38WDtIl/NRRwJnPJw9oy+7tu4Ayjl6u9I4M8HdMzhjgq
         Fbu9QZ/RcF+77fA0G120L64raDnchxzfwejLB6GqZTN/4PT3ElQWrlPHzAoHIe1fXhcQ
         j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001319; x=1788606119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=i7tQm1z2zrhtnpjz0tXAvZIi11lB5lWUxQ4vL0yqNBm+SaDV/8EtjaSHBncdT/UunQ
         ccXZDfbvDR9M2WhyrZVPcnl73Ufo8wBldDvabCMhc0+T7QZne+HVuOEP9LYWjY83qEdq
         O0chsIcESNJbjhSoXqp6dqrj58A9N5gc33Ba4sdX7dbEnqr+GjYCbvGEFW5VzDF51jOv
         AQb+j5Ognn6odMckfX+C7UsU/akaF9f9e+dudJG+l6cnmvogC/LMw0tt/jjHKtNBS6D/
         0F3cI4zy9Rulx6PKktW65neKIKCPWEg7jqi9UirPCPWvD6tu7R+PEB2UQemobJQW36ov
         ztrw==
X-Forwarded-Encrypted: i=1; AKwUvBxZXTICAqd2kXsmLzhXvqpFji/zVSpLPzJO+4CvW2bZ8SCuFMZNCDM68LrKurYRcGzo4koB/3xjPpurPDY=@vger.kernel.org
X-Gm-Message-State: AFuF++ntMvjvSlHZjgDU/UdGMVrki8N3x8kG3a5J98EVwWO5w3Rgy268
	SdLWz5Lwa1HZuM9ADqsxrbSC+u2wudSYr3TMs5HDSiLHfMBLW8uDkKIFc/NIJpw1cZP+a5YiSDI
	mbmPPESSXIWEutzUO4T2fzSAY9T7hJO8=
X-Gm-Gg: AYBFou16f3J5FLOZGKRPAz5NUZlHp5S90dZw62AFh58csD/FD48Uety8US4rJGXUFIV
	zn9oM776qdBBHfn54YOP4zei1zoN9nC3DOVK49f8VaHQXKzS5IKRluhNu25TYzG41O2UyySgyN3
	QS2M7QZTyga+9iuZyNftCuqPKsEzHvKc5QdET479yJOAaKTPsOjn6PKuVCRRyVACkLvzvzckJZ1
	wV/KfcbaGn9M1Jfsyw19r2UHBWCCMTna3KwePrGp6DYyXY42d+dP13T30WhO6oFedJv5Z/Tmnca
	igBYkA88KiiniVD1KzCmy4g6+8JVT+L64Q/hk2YgYOtvUHmoCfyxPtM3r74ZXCCZAJtcru4mKnv
	xZzYylMXba6C6CKJwVaaBMZk4bSm5tUKCleJtsZcKbCmVcHuHS5m+gtt/KzmH
X-Received: by 2002:a17:90b:5546:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-398bacc54eemr1390032a91.4.1788001318956; Sat, 29 Aug 2026
 04:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 13:01:45 +0200
X-Gm-Features: AcwNN1XslLuUNYYS77elbKGG8v398s8YpVlpDc2SDM6GYH7rCRkfYicjHiuXC00
Message-ID: <CANiq72mmxxrm3-a-sN7G=t6CEqHkG3MVvkfRMqe7NyNR+C7C7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.

If they don't work today with e.g. v3.13, then that is something we
would need to fix regardless of the minimum.

Since some distributions offer the latest versions all the time, then
it is likely things generally work (or they are niche enough that
nobody notices).

But, yeah, it would be very nice to have tests on most scripts and
thus be able to run those with every version etc.

Cheers,
Miguel
