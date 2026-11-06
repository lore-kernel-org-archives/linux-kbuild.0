Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956803;
	b=wu+yu+Q+debC8aS04SXd36DeaGUCnehtT/ZiAsj3+I0f8NWlm1wQk5Xpq2uMET/Psk3W
	 5B/0Hsz0mK/E116dJPL+sGL4FM4J6DqrSyjbawWXcmPkdVNnxmdg9DfPENafRq3xsK68V
	 W5lv7R16ZpPhizoei6HJqnocx8hhB6pfPBUgkLfNJ9pjcr0jIQRS4Y0W60s5EIXTpuF+Q
	 sC8bMcOZ7eNv+KbtZBNn1MVVNJVzdsz7eUOWksHS0cr3PK39H4EUQ2jvRtLyVQQzS9yJy
	 Khq19HQOed0SBWDvcrRqfN7aYGbzmbjrHrNUILJi3CLYSWT6lgt6ZOQ4t3/gx4Wxz/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956803;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cieHxXYoFdvsDAnH4UZMQYIUTVvb5arMKcEfb2knAhY=;
	b=3ozDiuM3RscIP82+A6NY50hydu0fLEjgOOlU68aQEuDPvoqy7EvtPJn1ETBT+uLmzPTW
	 vNQncxUs6/v2UWd7iJpN/P4b3Qh5CXGmQp3XPXfI5+CYlHwuRhC+DCXLc+feglDMScR9j
	 SW8Jnak16WtoK6pbIK1zv9xlaNzpu0lgizuFK/Z0nv1SdBxbu9Mxy9lYgrXvxUF0CzxqL
	 30MCQ9a/b2LmeOdAmcjk/Eyj5pAPehvk67HWAdoYW2RZxVy176SySVgHy0KbHUmaKU+IQ
	 mGXn6Ei4+IARMw4aFxV8R7jc7r/4hxCIZ07D+1YJaBrf7JxUFDKfoJnV5aN4ekzyC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fKLMx54w;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="qwHET7/t";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA1606A33D;
	Fri,  6 Nov 2026 09:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FA1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fKLMx54w;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qwHET7/t
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793956800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cieHxXYoFdvsDAnH4UZMQYIUTVvb5arMKcEfb2knAhY=;
	b=fKLMx54whJvpxEHRcjpGttIXBvx/EvgJqj38ppJB4rSa6YMkur7iVThvZSy4sppNnZYcfd
	JiM3HC6JBQUwF/QmMs+5lpyQJf76ptF7b7ImDb+lQdAKnjzflX21d9SzfoUVXQbYaXaeV8
	KrO5TjIgry4nsmTYdK69vuSh9Hb7flBSWHM/O+I150EwuWOm12ZehEV89UIRTX7iq4Qix1
	q+UFO0ctsO0bqpG0FvjOfefl3hVuWfBAFojydfnt5pIRSUdu1MlD8lQNvKs06gw0rZdAKS
	ElywcB+PRT9EL+Ed3HWJNY5oGefB5rewF8jBPVB2FjeR3AvQM2fa0OEy7pFM+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793956800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cieHxXYoFdvsDAnH4UZMQYIUTVvb5arMKcEfb2knAhY=;
	b=qwHET7/tjAbHU1i/ljh7YgwRvwlfdnJYgcbzZ/0mJeJDKyWQ4tClFhh8qGUC3QO0LrzRyM
	oRX6y5kc+XbE7LAA==
To: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	=?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	debian-kernel@lists.debian.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 08/10] kconfig-checker: Add support for rule overlays
Date: Fri,  6 Nov 2026 10:19:20 +0100
Message-ID: <20261106091922.7560-9-darwi@linutronix.de>
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
References: <20261106091922.7560-1-darwi@linutronix.de>
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

An kconfig-checker overlay is a YAML file applied on top of an existing
rules file.

Overlays are intended for distribution kernel packaging scripts, CI
environments, and board support packages; where the base rules may need
local adjustments.  Overlays may override any rule's field.  They may
also update the documentation URL or introduce totally new rules.

Add support for such an overlay mechanism at the kconfig checker.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 tools/kconfig-checker/check.py | 89 +++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/tools/kconfig-checker/check.py b/tools/kconfig-checker/check.py
index 4f79ec487da7..38ae4ed32817 100755
--- a/tools/kconfig-checker/check.py
+++ b/tools/kconfig-checker/check.py
@@ -7,7 +7,7 @@
 # Main usage:
 #
 #     $ check.py list-rules
-#     $ check.py check -c path/to/linux/.config -r preempt_rt
+#     $ check.py check -c path/to/linux/.config -r preempt_rt [-o path/to/overlay.yml]
 #
 # Notes:
 #
@@ -225,6 +225,48 @@ class Rule:
         if self.docs_hint:
             self.docs_hint = '#' + self.docs_hint
 
+    def overlay(self, overlay: YamlDict) -> None:
+        """Overlay passed yaml structure over existing data"""
+        if 'expected' in overlay:
+            self.expected = ExpectedValue[overlay['expected']]
+
+        if 'severity' in overlay:
+            self.severity = Severity[overlay['severity']]
+
+        if 'rationale' in overlay:
+            self.rationale = overlay['rationale']
+
+        if 'docs_hint' in overlay:
+            self.docs_hint = overlay['docs_hint']
+            self._normalize_docs_hint()
+
+    @staticmethod
+    def _ensure_required_fields(rule: YamlDict, rule_id: str) -> None:
+        """Ensure that passed rule has all required fields"""
+
+        # Normal rule files require every rule to define both 'expected'
+        # and 'severity'.
+        #
+        # Overlay files are different: an overlay may update only selected
+        # fields of an existing rule, so the overlay schema permits these
+        # fields to be omitted.
+        #
+        # However, an overlay may also introduce a completely new rule,
+        # where such a rule has no existing base rule to inherit from.
+        # Manually check all required fields existence in that case.
+
+        if 'expected' not in rule:
+            error(
+                f'Required field `expected` is missing from {rule_id}',
+                os.EX_DATAERR
+            )
+
+        if 'severity' not in rule:
+            error(
+                f'Required field `severity` is missing from {rule_id}',
+                os.EX_DATAERR
+            )
+
 class SymbolRule(Rule):
     """Rule entry for one .config symbol"""
 
@@ -232,6 +274,8 @@ class SymbolRule(Rule):
 
     def __init__(self, rule: YamlDict):
         self.symbol = rule['name']
+
+        super()._ensure_required_fields(rule, f'symbol {self.symbol}')
         super().__init__(rule)
 
     def _normalize_docs_hint(self) -> None:
@@ -253,6 +297,7 @@ class PatternRule(Rule):
         except re.error as e:
             error(f'Invalid symbol regex {regex}: {e}', os.EX_DATAERR)
 
+        super()._ensure_required_fields(rule, f'pattern {regex}')
         super().__init__(rule)
 
 @dataclass
@@ -333,6 +378,36 @@ class Issue:
     severity: Severity
     rationale: Optional[str]
 
+class OverlayFile:
+    """YAML overlay file access"""
+
+    overlays: YamlDict
+
+    def __init__(self, overlay_f: Path, schema: Schema):
+        self.overlays = Helpers.load_yaml(overlay_f)
+        Helpers.validate_yaml(self.overlays, schema.validator, overlay_f.name)
+
+    def apply(self, rules: Rules) -> Rules:
+        if 'docs_url' in self.overlays:
+            rules.docs_url = self.overlays['docs_url']
+
+        for overlay in self.overlays.get('rules', []):
+            if 'name' in overlay:
+                if rule := rules.get_symbol_rule(overlay['name']):
+                    rule.overlay(overlay)
+                else:
+                    rules.add_rule(SymbolRule(overlay))
+                continue
+
+            if 'name_pattern' in overlay:
+                if prule := rules.get_pattern_rule(overlay['name_pattern']):
+                    prule.overlay(overlay)
+                else:
+                    rules.add_rule(PatternRule(overlay))
+                continue
+
+        return rules
+
 @dataclass
 class SymbolIssue(Issue):
     """Checker issue concerning a single .config symbol"""
@@ -563,6 +638,14 @@ def parse_args(rules: list[str]) -> argparse.Namespace:
         help='rules file to check against',
     )
 
+    check_parser.add_argument(
+        '-o',
+        '--overlay',
+        metavar='OVERLAY_FILE',
+        type=Path,
+        help='file overlay over picked rules',
+    )
+
     return parser.parse_args()
 
 def main() -> None:
@@ -586,6 +669,10 @@ def main() -> None:
     rules_f = rules_dir / f'{args.rules}.yml'
     rules = RulesFile(rules_f, schema).parse()
 
+    if args.overlay:
+        schema = Schema(schema_dir / 'overlay.yml')
+        rules = OverlayFile(args.overlay, schema).apply(rules)
+
     checker = Checker(kconfig, rules)
     report = checker.find_issues()
 
-- 
2.56.0

