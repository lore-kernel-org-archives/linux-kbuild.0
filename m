Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638801;
	b=GcTSscBfCVNEulqsZxwV5Gh4llASW/Y9CcD6UZ5SiuMwrzd7tjt/mr2Q7kbyLj2bTU3c
	 67nGOkRHDOIlD/qEgFiDKbDB8kQ0RXRiyVyE/lKRpTcvfBmy8yS9+SMgXy7PWIh6LGe+A
	 uJg0HWeZheAJGbnfKxRwW5W9/3HCq4nuhCnB3TWrU8gYrEHbf7s4/xomDHFYbYZV4w0b5
	 A2ujnXwV9y/bE5B3vgeKhMDCTGCNgZyZ+ktYb4pmF+LjvKpSDyXgAzd1RNyw3evpI0rH+
	 5J/E6ePHHRFPkAqyBAATkBbbuemj7SSehR1yE7+nBA0ppV4gKUdJ0FjcBttQooBiaPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638801;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=t3kOzNsQufxZzFIonsmCvTESKohciNYU75no5dyN69Y=;
	b=p9Wm/loxZTE+kEe4U+ZdR4jbLg0KnabPk+0p12nHFE6BjECwMlWPCZMf01GKL+snewiB
	 UZYo16UWfJQRusGQCdDA/74VBCy6CcOVLjKqKeIxAwSPatamCzkCKc77CL89hhjO7jEP0
	 WRT1qWuNlFHSzVKy7RFCxYm4JfUIxDaM0eLfWvXI3/8h21xLeCoVl4u+jUhbV56/N8nPH
	 sly7r8tjxo1sRhCNKSDFjozy2NqdCr0EnUHZ2s2mK+BWQ6AoCRzSKRCJb35sv5Na6eVBO
	 qawFuV0RPUYDl3ZDl3rGC/fkz1gaV8UyZkdgArWclqox0898JPe0iiAJVWKyYBRWSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbxvxcXm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6CEB3606A31E;
	Wed, 25 Nov 2026 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbxvxcXm
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 717951F000C6;
	Wed, 25 Nov 2026 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638800;
	bh=t3kOzNsQufxZzFIonsmCvTESKohciNYU75no5dyN69Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XbxvxcXmfdsXSvbHOAncQq8im61axPm2Msl9LSc1UMhvynDCuS7KoiLShJ37/Dcmk
	 4hrC4Y0qko8bQC3QgQoYdxn0iURnXGqSMSKLKI8tC5xyxsuSefIK8jwo6w3oZI9sTi
	 2Wll5hwjxNc2Abefwk6Ve+j4ZL5O/YH9aHjGTfeHGtBpC09tcyMKSeEQWGTgJ0A8SZ
	 UpcLr9kn1i5/yjXP7x0xI48LQTz1hSENqumNQao/O5LGO7gJI+6YgQPa0qbEpaJ2sO
	 8vRzd6m7SZqrFhf17wdvWg1daZPaQD2QUJUgsTN5zhvehsbKm+iR4SHooE1Qx1p5Ou
	 uTT4m++TT6u3w==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Dmitry Voytik <voytikd@gmail.com>
Cc: Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org
In-Reply-To: <20261117132513.52725-1-voytikd@gmail.com>
References: <20261117132513.52725-1-voytikd@gmail.com>
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
Message-Id: <179562217907.3911508.5781947408297959984.b4-ty@b4>
Date: Wed, 25 Nov 2026 16:56:19 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-96b3f
X-Developer-Signature: v=1; a=openpgp-sha256; l=713; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=gHrm6Ye02hXiXxxYizXyZ81yvSb5/LNO+6CIkN4nleM=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBrBwUnmBtUPR3oEHwcMYZPsYEuSaWuN4haNDS67
 lEkdmjb00mJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCawcFJwAKCRAHUgpwFiYS
 afPkEADHoXG1XbUb0BR6frs5ZimDZdxHwxvJO8SnvHjR3YEuioz+QeGVKPHhizmiRNUB3opIgVK
 RS60B5vLfkT3B4GogZqJ4YLCetYhIy4hSXSblG2tMQ7lYX+jCtHXTXLWWq9gDNgGjud8kXUkZ/i
 kvnaRWvbqyw97uZSCGROc5K/h0qy2GahUyNZc1+DVBQU15IeXl+PL0idXnfUu+oOgQs0EVU5s6C
 WQQWf5yL2lCduErL3W69XU5o8+E8ts6hF4z2d0LiddGei5MvNTP3UMoyZ16yQuvT2D60eAVKpUs
 eYzM7iytqgfvSf9wyJuadZ/r30fxgHmyx7JPekGJgEDUZ+v8fKhnFIWrXpVjApvPVDGoCvBwSJJ
 vCdYvaNYQwNnpyfq2jTYnOoU84/r3jjsmM9jU69npSIDFmcHhkBbJTfwhPfQMdsm17qBy6PNBfO
 ZHAxOK1Na0n3Myx2i8k2AgNhnxlgQ+e/mrw0lk4cRWLKcrZNwBn5qmtoKEpZ+1VJnXtpAPjvpG1
 aSU3cMnaUVvFpWUUfjTDcliAtZ4h+y6oV0XFxN0+JnpjDNZH7hYthdKDGH4+IWU/61QTuQTB313
 o5WrHgF9V/X1UKv25shl00h2XP3SxxBgHEhUTAECpNxKL87fMwcCqNs/sHV+PTOhxDhl/VRl+zv
 WCe8wlTAzyDGrzA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Tue, 17 Nov 2026 14:25:12 +0100, Dmitry Voytik wrote:
> scripts/config: honor $KBUILD_OUTPUT by default

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] scripts/config: honor $KBUILD_OUTPUT by default
      https://git.kernel.org/kbuild/c/9930db30

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


