Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbgAQQSa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 11:18:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2] kconfig: fix documentation typos
Date: Fri, 17 Jan 2020 10:18:22 -0600
Message-Id: <20200117161822.106635-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

From: Bjorn Helgaas <bhelgaas@google.com>

Fix a couple typos in kconfig-language documentation.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/kbuild/kconfig-language.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 74bef19f69f0..0148ae82446e 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -594,7 +594,8 @@ The two different resolutions for b) can be tested in the sample Kconfig file
 Documentation/kbuild/Kconfig.recursion-issue-02.
 
 Below is a list of examples of prior fixes for these types of recursive issues;
-all errors appear to involve one or more select's and one or more "depends on".
+all errors appear to involve one or more "select" statements and one or more
+"depends on".
 
 ============    ===================================
 commit          fix
@@ -656,7 +657,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
 the deduced semantics matches our intended Kconfig design goals.
 
 Having well defined semantics can be useful for tools for practical
-evaluation of depenencies, for instance one such use known case was work to
+evaluation of dependencies, for instance one such case was work to
 express in boolean abstraction of the inferred semantics of Kconfig to
 translate Kconfig logic into boolean formulas and run a SAT solver on this to
 find dead code / features (always inactive), 114 dead features were found in
@@ -683,7 +684,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
 boolean formulas and run a SAT solver on it [5]_. Another known related project
 is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
 has been introduced first with [9]_.  The basic concept of undertaker is to
-exract variability models from Kconfig, and put them together with a
+extract variability models from Kconfig and put them together with a
 propositional formula extracted from CPP #ifdefs and build-rules into a SAT
 solver in order to find dead code, dead files, and dead symbols. If using a SAT
 solver is desirable on Kconfig one approach would be to evaluate repurposing
-- 
2.25.0.341.g760bfbb309-goog
