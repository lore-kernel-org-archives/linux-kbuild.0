Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414464;
	b=MYRJefWiu6T2hBt3nBksFykwDl6y6aPtxFy3ay8yjqHoIWChdHQwUvp7muxtklOV+QNd
	 GtQLNDD6IYbJo1Hio4zCkWzw4dIRDa0c8G+Uwtf+dk4mJQE/o6HLdZzgAEFE1+If4ILzt
	 /c88KLjSib77bU29ARC6SkznZ5n6By5msADAz7ugsr+aSwX4asSj98/lToufOPXFyFPUV
	 QjvzzsKLbaXETrOGxiScKFWXm1pP9KS2tS/uwiWCqkMT2lPWPoxKbVxwyhr9n/0/veRAZ
	 KtqlBk/ek/o8K4Hxm/SF/w/0efdjPnN++S4ttSJappxQxDCS1ynG37zPmCGKplRfeVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
	b=00aeQWv4WfCeU7GzYJciLQFiCPNxCdNrgwv6ltOG9XYCgXcll/k0qRNeDkuFEq4/Tvbu
	 BbmnsNwLy3pskmPeDgrR0G6a87tspHrFQ8MkNfjxkS23P5yAeOCP7YyHwqrtdPy8QHmrJ
	 WqUwuVwIl9eVp8mgB1XMJco2sJ99mB+sT+KfcCDH+Mw0HNhiVaslZssk4HngAtBecnNPM
	 +PTptDNZ6bERhzsiVgV9eJrDfhwd/HvJ/l88usvffARkncJCVMfXf4gfvVxIuvbfdoOwT
	 bOUPMN1nPHKA7/dLlQC6zAt2cGOrVn3/nuH4vKl+PRcfTYy5n9LGwu+ccQyFsssi3cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F81606A32D
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 16:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F81606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVdq0ZL3
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dc4797082so102019eec.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 08:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414463; cv=none;
        d=google.com; s=arc-20260327;
        b=cLOcmmkBYzDs0Qv8B7KAdhtJzpsNDBCNI9jNM3InPKWGBI/+rZZMnpcxS8XGL5lNUk
         Yfoc+MKHsA3bmwS+9aCOrdn5+o/wy5AgYcnX/xS1QORs8dY6fYcfDj+qJ290KlGpgSYd
         EiLUBC9F2KSb+FWyqGiyG58Bmbi9AM+MIB3Z6WiouMbnYXsCYsh3PdJY05wWkg5aa2pE
         5o+JhAbnenHh1CoN3/PZh7+Gv9Bj9LHsouy0Wn78i6T5ZkpUaKHbMxFpn67X4earxfIF
         G8JZERRPVldJfv84r5yL227CfPdJzevVJpdslKsAPKX5A/6Kq6xrC8BBq1dPvOfR9FKE
         E3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        fh=VuIMFASXGpEI+lc2mInKCZ1Xyl01aeWChJ+e6AJ3zqA=;
        b=OUNsFmB9w189y/gWq9dmNIImDqnST0SQRhJOvoWl7NWElSK84Sb4zfVhYy64TvSIPp
         jDvPtQhDBUj0TiGOa/mVSfZvNork2FqpQnJpKx9z4JxeDuLr6wx7HQ+BR7HySbFvcsrm
         oC7ezB+S7koFZMJ+PUiY++VfNsjZkDbfOQmX/MnQ4ZjyvUMjOdjDLmpFrFCCoXbnfKfr
         VJf0clGBZq3y5Fmin7GeQkw490v6ZaObDNapPxwA1qGcDbEydkXV9KHR0atDOQmmlV0s
         yGdryT67XnC9LCfknyQkkHva7jMe4XhzHSE14pgcHy299hdErfegTlaCgzvNFzReI0/4
         luVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414463; x=1795019263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=LVdq0ZL3sZPzYW1pLPrV0cLEj3jwdj2Zg7RoE2RuOl2Hhv3wgcEiaJO901riGgUhRp
         IRmN3MLywL9Pn7R2fVW8nhJVR+LInKI2Qr5BxzQDfDshUwk+yGiqksCMb7nETFstAL0t
         aYyyQGr/YToFkc71VnaALv9merv+obCMqfGTJQeotkpUrl9b0/WwXHs7DrLaktruuqtx
         rS3+69M9Qm3zNCI6D1TF1zXhsnBD2CbJv+rFim55I9GGur6FBs5ZrHlYQ9NKw6Kh71n3
         O+4cIuAANTLZPxlzg4y+yM++fGnOwYdoJRQG8fWa3t99az16xcQ60brbYKgNLRNuKF4R
         momA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414463; x=1795019263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xdk0BSQIUx4RwKz5HGHAlu0ZFnzjgWp1hYTFbEu5CU=;
        b=GyXnl5sBk91UFm1iNjTFvFshxPsWaTvYcWWB0ui255R1WGKcdlLJwvBZqDKGPbh/iA
         PaGMcMztb9VplspnIHiMGiY/1wZ1aojr8Oh022wYjQfijqNvza5kxbN5vMpC+iuSmHl6
         yDnVxhY3QaQ0aMK3eTER0/Uynvhyyx1BgIyeXJwX9x8E9o9gk0Gy+OgEA1gQhZWf1YJC
         qr4RIEcR80qK694jUouRmBdT9WS9Ir1Y9WSn7MHrE167xb2HLh9F3If7YrVzDJCXWuoE
         PpmwoXpEWojmhjE5hwtO4lmCn/qZc/fkzHLsY2HUS5mOm30AQ6F/rUwDNHT0i7CiZVwf
         Rn6g==
X-Forwarded-Encrypted: i=1; AL+hErE9lr0+3q5Thxbd0q0e1s1ZGP02lpnY6NbFPC45cztgMLHQTFm6lt+ZGhsewTgvrjJiIL2HHJGxXCgNq78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d64Enfm6o1qsoE5oB4MFbDKazyA7NxBsZ9p8RSZnzjnEP+TLu
	h+MXsGU7KVT/+Zu03wYomx4Dho4mXflK2aDYa2yHamZxqwnSMRp3xjDc3ZySGCUYB1yX1i2NWsl
	8HdcU9Xubpeu15/uz3d/wyjZQLF3aDwA=
X-Gm-Gg: AYBFou0k9tK0J9+kBB0ZQ3Uw5AI5bCXalH3cYXFt2VVEuMmv4l+4KmKdt2SpqpEbFpO
	5Xi0Ue1WsHl0usIYJzLvv3u/FG0AmxU4cUsRE3G6t7V51lQx0IwYjT3TLwKdJwrUlBpvjgfM3L2
	/aTNGAJogikqCfe4zH/0kv3n3jFGDSZrEfuC/FuYt8izNNdlgl30rrOrB3ngSBK6Xlbn/nUQQju
	fEPlsNpTygvIHqxrEm10pPPR2R4KdUMHMvmYYw3s7vTcsJvvDlAC5cQ4VmmZz4u3QHuHTKRKfDa
	3FwHlcCtcIna7vr4P5VclPTPO4PgVd1TR0qvfHIVzF9V7PSr2xrvfzCpw9ilgpWJDD8HUgDLJYl
	v7+RO8htm4nCTK3rWavBf2xQavP1p9cqqMMyj03Fgy8VnaLG95jMJq+IBNGQ4e5q4UG5CXURn6a
	8P/KAmpdeAUEGtiRylgBORxdkhbXyhD9KIRCv6fOM7ABd9Kd2PhluUWnCRGJagsbWsV81WsNI+0
	V1llHaDJZqnK0YoQzuffQWzx8yUXAQoWeM=
X-Received: by 2002:a05:7300:7aa5:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-37685c76d17mr4975850eec.2.1794414463417; Wed, 11 Nov 2026
 08:27:43 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avSC7GXOwnbuycR8@sirena.org.uk>
In-Reply-To: <avSC7GXOwnbuycR8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Nov 2026 17:27:28 +0100
X-Gm-Features: AclHuK8AgFv2RXK-XtwjJ8NP3w2QWHz_WEO_LIt_zbf7rr4iTP2nvLvmm5WOtgA
Message-ID: <CANiq72nu0CQtZxODepvZOEoD0biE56Jx_2-exBvB8psL_Ynk8g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-fixes tree with the
 kbuild-current tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks fine of course, thanks!

Cheers,
Miguel
