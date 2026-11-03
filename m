Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703862;
	b=Nh6BlhvsC4Y5OiTqGfmxe2sQxsvPTLQ0ucF9bwYb5H+Ri//gSMUUKp2RQqnsMqD3btO2
	 IArzSsbpRO8CPg8Urjgf7ILEe7cFFR2kF7o/OkphXiEJt3QpX1bCWHoG47J+DoWZZ0hjm
	 +DGqgzcAaANaXgqrKDox4oAEeLoIyuRyvP2R8OC5LIRssfr+E2kvCD2/FmFLFNnPmEzkU
	 c5XBy0JHKFA98mqHpU7vFAvfrBBQ8Vjp88gDuVrCvJ1ivGIe3I8noRT8UaA8Bc2o7FpVt
	 +iraUWW6F+Q0FLQcmeJRGtdgE0xO3P9c6uV/Ot8Saoy2nlU0WlFGnVxhDAFhAnLHYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=em0sl5f3cl7hm/dK9xuLVyHUX7w3KpTJOOXQ+Qvn1oc=;
	b=fo2yanvNLC9cGT2bib1kxkY6vYKwwlZ8j2qevp+cUkUOTAx8sq5uD8ZTad3OwL3KyRtR
	 Y4gfKungxaALyILf8e6ShQLHvRYU5at1sbt9QXztRGpSbAQB1K6ZRUZMZnJBemt+bIym7
	 PzWz+bnKUoE4a3g9UxPA7ezyFA5iho4plQcXzFTHk4wKYb160dlFCH4nZoa6q8ljegWGQ
	 lyRZodFPxnEnL8eTVkR21Tify6XAt0n3EHzpDeVN8oxaFbvfSDvpjKmNaiJTRcSXFlFo+
	 2WG1PdyzzyW5zbhrDytdloJyDJQ5fIkiM/8bugr/S1tHmqUH2GngS/shavZezrrDI5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.172
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D5D606BFBD
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 11:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D5D606BFBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJm0s52jrzC4r;
	Tue,  3 Nov 2026 12:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793703853;
	bh=em0sl5f3cl7hm/dK9xuLVyHUX7w3KpTJOOXQ+Qvn1oc=;
	h=From:To:Cc:Subject:Date:From;
	b=gHVl20S3De8kRxBxcsHgpLh0PFkoIbwp/0MtJSDwHMQD4wIJUtm6qa4EpWD7VGMJu
	 Suzrh8G+5icVZI8mKULuXAKOmYqvmqf+qHvtw3hkRbn7QHh5uzmqM8G05kktZZPurl
	 8IBjIzMf6pe+fvoDQrheLAXkS4Aih5hVQ0K11BC0pJ4Lpk0UvAh2ElTTlisU4SgG97
	 l/kGInTTwGqMU/U9F7X6dOE7Ky8zVq3F+jw91rkNZT5Lr3ySCrlpD3m/rZgQwenst7
	 yVjVIhB5hWpO9BGYhlK1sW9EdTZMRlfFySZFVSKsVxuwTfgMSSqiHUFSFn/TIVZcUz
	 BjsA04GkPPYiQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJm0r5SbjzqGb;
	Tue,  3 Nov 2026 12:04:12 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOCJI-00EwZs-1E;
	Tue, 03 Nov 2026 12:04:12 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] kbuild: detect module name collisions between '-' and '_'
Date: Tue,  3 Nov 2026 12:04:11 +0100
Message-ID: <20261103110411.11698-1-info@daylightlinux.ch>
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

Kbuild converts hyphens to underscores in KBUILD_MODNAME, and the module
loader treats both characters as equivalent. However, modules-check.sh
compares module basenames without normalization. Consequently, modules
named foo-bar.o and foo_bar.o pass the conflict check even though they
have the same effective module name.

Normalize basenames before checking for duplicates, and use awk to show
the original module paths in diagnostics. Preserve detection of exact
duplicates and leave distinct names unaffected.

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/modules-check.sh | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 4c8da90..3d12dc5 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -13,10 +13,19 @@ exit_code=0
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' "$1" | sort | uniq -d)
+	for m in $(sed 's:.*/::; s/-/_/g' "$1" | sort | uniq -d)
 	do
 		echo "error: the following would cause module name conflict:" >&2
-		sed -n "/\/$m/s:^\(.*\)\.o\$:  \1.ko:p" "$1" >&2
+		awk -v name="$m" '
+			{
+				basename = $0
+				sub(/^.*\//, "", basename)
+				gsub(/-/, "_", basename)
+				if (basename == name) {
+					sub(/\.o$/, ".ko")
+					print "  " $0
+				}
+			}' "$1" >&2
 		exit_code=1
 	done
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

