Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666498;
	b=roSg/BmsSDPphVg9AveDnFp2Z+A4IsYOzSAAuGwCOxIN+OKUjXTqdVj+9ceq0iUnRcAh
	 2KaMEal4743tG2Ivw5+IO8EU74s12jhKSqY/p6Cky4bzFzfFDshZKsuNrV+oHaYSeLCVM
	 o4XPcPyc0AoPSP2LtTuSgdtccUkNa353p4p1L4fS8c/QP+bOqcOlNp/jN/WL+44kjw4g9
	 ezI6qKd5/D/PI1akS8vbmf++e85YlejjwIYY70/rJ0MAQhnNKQYtAcLN1VvnsAOUgNm7j
	 2q+6AMZsFI8yaaLbcxzG5pSpJxDR3yapoRGLYTcQhzhSb/e8ekoFYAFTTRGUIddFniA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
	b=sUiAbIgVoynd4o9TUNAeS0Qw0T9mzcEZm658xZbMxP8QiMMTLy1AOZbbPB8CGXRfIqvN
	 Hz/0qJ+sVdZ8smKRSJreDz605dbvvXvZAIqicUADrCHe8LJB9DEyf5yQWkgIRFNS9+ikK
	 zvIN+Aj4syxxvxWEUKtFvMeTRLokfT0SOo9W03xumvQ8AosGLDMX4Xb7MO6YxOW7s0oeR
	 8hIL96XYo6dzZvWA6NVD9Lwjd+Xqv4r9hJElGXIYi/qs+1QVBpAHYhNCiyj/vDZwpq1Ta
	 4I1vHlPT9+pevrheTEqtcuPvrxQln//s6Q7akAWajkBmmR+3uAfhAYcz3mlCgeSXTzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+4R3ovY;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110A606A332
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 14:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6110A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+4R3ovY
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2369459f8f.0
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666497; x=1795271297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
        b=q+4R3ovYZbd3E1S20U1Aa4ML4vU6N0d9VX4pI7dJC1FzV1C0gYGljRlnC27lur9gQZ
         YugQHs5bQxVznydDn3qYG2pwcBsqY/YiYexRPjAPgU8L1MmWkLFLKM4dNsWF6X9DLjTv
         65bsh7L0NNvNMpKQQfDOODwA+FtWtNz/sH9kH+GVKC/sy+14ztxMurYyTlLolP7GVb7r
         rQN/GfkPzqJnser1+TZnLpkoIyYQpSidIKcBPq2zoZVkJ7gQbs5UXo/q/hYcW4OIpgEK
         hY0jrQYC8qQ33c/FtAr7PGt7x6IvOSF1XPh3lSYdkkofselScUqnYK4OqdxON+6oB8aC
         C7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666497; x=1795271297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKd4jZbLeaqRjSZ/bcG2vE1bYEI/pNWLpN8kMR29sBs=;
        b=Jsrr/0391nrknRPOsd0mkrWQuOOv+ivxvntotL9bDQ8u0OLjUNqOL4jI8k/YsBWM32
         7LKkoqXdAcmSw3fwXgMUVCENNJyaK7zJFjtKBnr1TtvGTdgeGBbQCx1NQtZCkr8dwBsq
         8S5f8vMk1TgotlKe5Ll350zSHSbdJTjQrABBnv5Xiv5icHTx+LMx9NYHeg8+qhSVPAzH
         D2aQZc+HG4KG2ovxCmNU4BW6esvOnm9aYEJlcJtMsi7VilIBWfokKp5ych8cv+/x+7jT
         MNPhIG+wxTQcNtpmriqs7KSNxJafJ0+9sXZKZlQ8zi5E+6wT6jyvesgRoWkL3lcJBMDZ
         0Wxw==
X-Forwarded-Encrypted: i=1; AL+hErEfYhfRpyNEZrElHVEBTogG4Mf4s2IQ6ozR+6P652ACSLnuY6fsgX/m7N0oKTUnM3mfyw2wxGiwxkPLEIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZZ3KfpWA0SlWOJbU6S6BfAh0FhbPvHZoQSlyirA4AdO6xq1fQ
	jILSG/7FjWmEqswR4RZJlA5nk5SPxRBfc4qQDOYreAyic7j4bhF/UE14
X-Gm-Gg: AYBFou2DwbkPErdps+96qLPIHULMGnroqh26z8FrOZYIiTQOnYV5utERHasqgP/YE/s
	zJ0uL94UWqMl9bvVNpUsj88yXtiv2DG+nRVEhwNo9cKSkbnAoz/a79dtG5ZtzYI9NE/Rq6l/zo9
	qW3gXDh9jq+zB9jA0ytE2oKmeZYDISrqANBLY0JepXh+Kqd9+BqtkZOK6VeLQcklJDAsuCkyl67
	C7R2jCVgWK2sEt1xwPNHxrXso1LvuZy/in+BrW+sMRJv9FExB3Rm1CwPcDeIr9DZvp6MmSzjbAj
	KjTp3227b3yaQyV1eYVh7+vMcUOjeIhZjMbM8uVetBuEkVEgqscWHTWSqLFJtKtOuumaMasj7NN
	gp4K/g72hc+wI4PD8OnA6jGDLFjeJhA8hi4kI1IeaPKwKjSgWqsYbwAI3j6MKx7NqaIC4nh+VFm
	xzkrH+1wxrIayGoauRtyT8v8eQoRkdr3s0H1AYF0I9OJ+89jBLyoy8AUOj8is0D4q1NI1CrcP+d
	18YYBXGKVFxmMU9OU+fGhscMtuuaf1PWeAQbpkllg8CIT98RmmN/MWoBe00Kn90lZt/cKFxslPI
	PGfwJ8AyGguvTvFSIoGSB4j6U1D8YeKPa7biulg+Mgd6vTAlN+ClFIi2SlrRmibaFw==
X-Received: by 2002:a05:600c:83ca:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb55a4e680mr118360915e9.16.1794666496622;
        Sat, 14 Nov 2026 06:28:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm156028195e9.11.2026.11.14.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:28:16 -0800 (PST)
Date: Sat, 14 Nov 2026 14:28:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 02/13] scripts/kallsyms: Improve error reporting
Message-ID: <20261114142814.30c8786d@pumpkin>
In-Reply-To: <sashiko-outbox-208961@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-3-david.laight.linux@gmail.com>
	<sashiko-outbox-208961@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 12:14:50 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] scripts/kallsyms: incomplete errx() conversion in write_src()
> --

I need to do a v4, I'll change the message (and remove the '\n').

David

> 
> commit 74224a3e189e43104e9d68aefe42fe16a066052c
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: Improve error reporting
> 
> This commit converts fatal error reporting in scripts/kallsyms.c to use
> err() and errx(), updates the usage message, and adds a --verbose option
> for timing output.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 140e888bf7133..aa3a8ec83fbb8 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -490,7 +485,7 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
> >  			long long offset = table[i]->addr - _text;
> >  
> >  			if (offset < INT_MIN || offset > INT_MAX) {
> > -				fprintf(stderr, "kallsyms failure: "
> > +				errx(EXIT_FAILURE, "kallsyms failure: "
> >  					"relative symbol value %#llx out of range\n",
> >  					table[i]->addr);
> >  				exit(EXIT_FAILURE);  
> 
> [Severity: Low]
> Since errx() already prepends the program name, appends a newline, and
> does not return, should the "kallsyms failure: " prefix, the trailing
> newline, and the unreachable exit(EXIT_FAILURE) call be dropped here?
> 

