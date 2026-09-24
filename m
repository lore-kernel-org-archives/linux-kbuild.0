Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE840BCDB;
	Thu, 24 Sep 2026 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247446; cv=none; b=SzHBdL2cv9yRN0NmPMCBfYXnVGSNWy+AkLsqCbBMkdG8JC2uoT1ctKEbzTl+1JSo6pZDp0PQ9+yepMUQvvxWicGXSqmkcSVY6l1vq5IgN1/jlLx05mOR25hvOXApp+BSsBuD0vSaba6TerOnWotWnWFGG6gpkmr+LKmV1FLL8fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247446; c=relaxed/simple;
	bh=Qox9v8unrwTbF+4YIdkCSGD88B0vaoJpOJUYA8G7PUE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QSKI016sTDDqz+i7oGR0md+vVv4lh2k6A4nsbO9/IJhkWxXtdi7J5yWovga6lOV5LFX0GqNuJUHz8gytlHQ9RLJZ5I+lCm781Y6QPjQ6Ts7hBBozRouzmD+YzwXCJNVpbgjbYN5i+fasu3FpcodjW8vg2A67/XcMXkiDvbr0v84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=LGkXD9vS; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="LGkXD9vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790247434; bh=Qox9v8unrwTbF+4YIdkCSGD88B0vaoJpOJUYA8G7PUE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=LGkXD9vSY4iBxBSYMe0Jb3tKD+/KDeklWJegRvUOLGgGJ1EVn4dORRKZlAYgdghdD
	 5uR0BrD65bn1t3wEfQKAXke89NDy8DI4MuiBEZ6+PUusMfveXXD84joVhOlBhFNEj3
	 WdHCVNrTCF92xw/zl4ehoZpwbR9rMQ0JXGpLCIygHnwuJPeo3M8j8ftqeDuQjpj1WB
	 lK8ip/LeBq3CYqXRR4dFZOqMG0RsnXb0XjS4ZZU1QI90TUmcU/RmMrFGYcpZ4YLyjO
	 bbsYk/RsfQByLM8aOYP3wl21TVtNuoXSVi1N2gdY3Az7nA9lspyl8kqAErwR2ytvUi
	 HkSYv7FD+dIcA==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab5020a-03d5-7f0000032729-7f000001c9f4-1
	for <multiple-recipients>; Thu, 24 Sep 2026 12:57:14 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 12:57:14 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] kconfig: add prop_err function to simplify
 property error handling
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, n.schier@fritz.com, 
 grahamr@qti.qualcomm.com, rdunlap@infradead.org, nico@fluxnic.net, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260922163749.2031594-2-julianbraha@gmail.com>
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-2-julianbraha@gmail.com>
Date: Thu, 24 Sep 2026 12:57:06 +0200
Message-Id: <179024742686.3875862.8878765161331000985.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=Qox9v8unrwTbF+4YIdkCSGD88B0vaoJpOJUYA8G7PUE=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqtQIFAD05hoAzmdXzmTmBmsfNmtx+9QgiiiP7q
 6YnOMQvqjCJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCarUCBQAKCRCIxryciJpt
 uK0JEACUKzy3nfSXeDRj2lUDT9wyhTeRPDAC3IeuYyoYxle3TADZzR0SwDzE83/JNHJucN+Ijq3
 GGaMtBMAq388WQPxKdJU6d2x2Xw1sRwNz3ANPp6cS4JuE0VbYJUwO4A7y8IS5anknyShb3Cr14B
 ZNslduntxcFomY5d1pDOwExRpy9Xb40PQeCoUvlRH3rvAJ9lMZj+uay4g7oU+XkMKAAnqjJJosQ
 ChFDi13+AJO+zQiLMblnSxSPOPNdfoqX6FJsaHJYCqhACKNsv+/yM8Hy4xPJ+dzELaw3K8mxgD+
 J19xQhVG2haPhrfwou4/29Ar1zL9aZSKMvDWwEpbewyP05gBfJXuK7YFpw1J5F907yx2A3Fh0y0
 8WiVkxkQ4jf+Lo0xHBiavRmorA1bz7pLM9mCY4ThtHYQNfJsnNSDTmKIr3izt+uSU7Rg1Owyo3+
 xvPnc3uF4DN8k2UWyoVWFT/e1g1wWkHOpBLjoKeVpxvtvKKRHagiZczUgW1OZhelURBxF24PyME
 57xJ90PjBPUSMf3hmDmCWQAUIsLQEcDLoMz1yeGpfIAtTF/DS6c8Mgle0iEGTI487xFfFw1Wz+O
 awvSINAx+J7nerw7O02jP3F3+LVK2tQmCtovftypV8ol4jdwXFy8hxjkgzczCvOn80y6Csdr0b9
 uGCpZypR+EEuMiQ==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790247434-ED7F8EF9-556F56F2/0/0
X-purgate-type: clean
X-purgate-size: 878
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 67992A0885  external: no

> As suggested by Nicolas while reviewing another Kconfig property error [1],
> we can add a prop_err() function to simplify the tracking and display of
> Kconfig property errors.
> 
> Note that the formatting of the error printing is changed slightly
> (removing a space) to better match the formatting of warnings. This causes
> a change to the expected test output for the existing errors that now call
> prop_err().

I think it would be better to keep the space here and add it to
menu_warn() and prop_warn() output instead.  Then the format matches the
warning/error format of gcc:

$ gcc -x c - <<<"main() { return 0; }"
<stdin>:1:1: error: return type defaults to ‘int’ [-Wimplicit-int]


Otherwise, this looks good to me, thanks!

Tested-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas

