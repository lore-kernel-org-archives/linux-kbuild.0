Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724127;
	b=2LAF7XSbBMEz9dhgPdAguJiufnA6WfOlIdOnRX+q30jsP+e+1fhCs5+MWeLlJMyox6Ad
	 gSiY5jee6/qBfLLrDVHai+cMcYExqowUrhSvGCGSqA4uY5PlSsYn1CkUmpBaMh/a3+H8U
	 V0i0CsZcCQMG0sJjHstoyY/GDfQPSOZVJ+uLvSt2AM5IBJj8rVER+ezxe7I+niRbn+7E9
	 I3hkmJnoCQGuxzEZF5Oj7Q0xSCAMhNIZ1G1oaDFQ+VMVegQwbjG/5WbOtd0Whto22w/PP
	 QWcEHDW/H52MlhAva/Pl+sUw1QcD5EjTUU0/CaFkilE53NaIKoUbDpuJEHdxPcED75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=p/XqnTx0XYfkrhj9RyjTRFalzD96F4yr1muAv7ATL5Q=;
	b=M1F/2qseGcz0/KcQPJ+Ec0j6iS2RXLMAcQMGk+joHoC5XznvwOWbMumSfkQff492t4n8
	 Pm5hnyp5uC2tQcagooLckFN27mioSFMWhYyjKlSq2Ydv1Psb1+FHmmyUcHavD4W/PRPl2
	 V8eHlawLdYpePp7ODCldhhB5kqm/K1wUDoCd4aFKaXa9UeuP7tmJCDTtXMYq4zbt/UeRa
	 8nKQYLPT2NPflN8gXp0cTb0TzayqWKIRWWSIv30uAqqYZNFDHLyJuBkafJ1OkWGuOAqC8
	 3GQ7gWvKJIVSnqhuxCGrWm5N9t2+yTRcD1SLxB9QfpiGcVRaOfzimf6LSIJ89PPds7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510660A3819
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 16:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9510660A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVh4f1QzkdJ
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 17:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724124;
	bh=p/XqnTx0XYfkrhj9RyjTRFalzD96F4yr1muAv7ATL5Q=;
	h=From:To:Cc:Subject:Date:From;
	b=sl5lqNeJg9iRpchy0AWh7jawRkpCpCp/iYFKuOFE3ZlqmMV6E8KOOC0md4xUijW2T
	 /bOgjPwtNxa3lxhvlc1lzEilePqsXAgcQ53DmFuDNF4/5QtIX4P9ZK+rRWN4q0u+oN
	 wDfI1aFl4j83GqNwW2OOMmDiSa1W+gb01/Jw4nwCgXZtoKEvQ0tzJ5uXtAaLesV1DY
	 pIJGzcdZ8w3qwv0AG4zZM3g/PYRPXGI7zZjoyvo2YEqXZ9YmHAjPF13ccQEH0/ipIK
	 uu7rgqLE16lyNWnureEa5CpZSTzhxX7dxVMUceznzLHy7jgDhjILi48ECC8cg/7Eqg
	 t9eCEcWrxACsw==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVg6hQPz6x6;
	Tue,  3 Nov 2026 17:42:03 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaF-00FDbz-1Z;
	Tue, 03 Nov 2026 17:42:03 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: hamdy.aea@protonmail.com,
	nsc@kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] scripts: checkkconfigsymbols: match complete numeric literals
Date: Tue,  3 Nov 2026 17:42:03 +0100
Message-ID: <20261103164203.129644-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

REGEX_NUMERIC.match() also accepts the numeric prefix of a symbol such
as 64BIT_MISSING. The reference is then discarded as a numeric value,
so a misspelled digit-prefixed Kconfig symbol is not reported.

Require the entire token to match the numeric expression.

Tested Kconfig dependencies and conditional defaults containing
64BIT_MISSING and 32BIT_MISSING, alongside decimal and hexadecimal
literals. The symbols are retained and the literals remain excluded.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 0bd38ae35522 ("scripts/checkkconfigsymbols.py: support default statements")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/checkkconfigsymbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 9f7aed98d91..5582e19c007 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -459,7 +459,7 @@ def parse_kconfig_file(kfile):
                 line = line.strip('\n')
                 symbols.extend(get_symbols_in_line(line))
             for symbol in set(symbols):
-                if REGEX_NUMERIC.match(symbol):
+                if REGEX_NUMERIC.fullmatch(symbol):
                     # ignore numeric values
                     continue
                 references.append(symbol)
