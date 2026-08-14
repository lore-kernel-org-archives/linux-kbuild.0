Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40838D6B8;
	Fri, 14 Aug 2026 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706885; cv=none; b=gKMsXum7mFczoUduBnRpOkgDRhINvNFsHMxFq+71tjJQl6NbCw+h4dTE2i0+tELi/n6mu6k4euJbEqukWonTa855siajC/p2XgEfC4tkoHxiWCCPJ8OOrC6h0C7IzFhJNZO/MzevuTPMIrkPlOW+MBxS7bt4y9Rkm9eAkpSplAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706885; c=relaxed/simple;
	bh=Qo0Ti5Gp3OxNkMB0l306rDnqCRK/48kSyY9CGWHOYrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyrI6rDypN1TvBduppTdyT8nRslCr7ZJ5EejhDZaLWon1bvbXewGsflNhU9381Dve/coJm0CcTsdWpL1HViClO/rmAve69hnEmrL+1H/JuVIrU9FIBWIasYCNAF8EO6b3uXNdZTfFDUBYKhDXw4F6RjFyedBTca4adNGp/jFuCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=llUdXEFF; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="llUdXEFF"
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 802ED200C1;
	Fri, 14 Aug 2026 13:22:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 537121FB67B;
	Fri, 14 Aug 2026 13:22:22 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DjeCytI5e7GD; Fri, 14 Aug 2026 13:22:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 7C2EB1FB763;
	Fri, 14 Aug 2026 13:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 7C2EB1FB763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1786706541;
	bh=XHmLoz9IiEX22y6m3c7/kXwhrWw1Xq8DoqnRRXFX7XU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=llUdXEFFkPdHnkvPnOwbO72VESxx4fGu0cAH7etlYcLJmX1T3BTSrDXe4QAoDR7Bl
	 pNtk6f86FXXIstE42Fx8fa5uHcg0OqSNaUgNeqzwBUXnMPvOvICKJCFP1Qk+CwK3pF
	 d9cegj1++a9NjZ3afvTBqdTNlReKxSHU98B8uokEicQkhU5C9tkoFPdhmWMqbsoNrP
	 fHR/IiLVSzf0YC+yGEoL4lZMJ44qn2V+QjqDAsmmwXB7v2hlD1k/ZtNmx/nMSbLts+
	 pabTh0RocOuhi3k18wqUoVvZINKH5nGNWACNbGt6xWLqBVqd5X3q4sqNro3Zjwvi1q
	 TLlYA6lReul7w==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id YKLl2SpdpOIE; Fri, 14 Aug 2026 13:22:21 +0200 (CEST)
Received: from luis-Precision-5480.local (fire-karlsruhe-raumfabrik.tngtech.com [213.144.24.146])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 308401FB67B;
	Fri, 14 Aug 2026 13:22:21 +0200 (CEST)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 0/1] kbuild: record real-prereqs in .cmd files
Date: Fri, 14 Aug 2026 13:21:33 +0200
Message-ID: <20260814112134.832243-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

KernelSbom (scripts/sbom/sbom.py) reconstructs the kernel build graph
from the .cmd files written by Kbuild. For most build outputs,
KernelSbom must infer the build inputs from the shell command stored in
savedcmd_*. This requires command-specific parsers, which add
unnecessary complexity and are difficult to maintain.

Kbuild already knows these inputs as $(real-prereqs), the non-phony
prerequisites of the Make rule. This patch records them in .cmd files
using a new metadata field:

    make_prereqs_<target> :=3D <prerequisites>

KernelSbom will be able to read the new field instead of parsing the
shell command. This submission only records the field, support for using
it in KernelSbom will follow separately.

The issue of manually parsing shell commands was originally mentioned in
https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.co=
m.
This patch is a proposal to address that.

Cmd writers and consumers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The new field should not affect existing behavior.=20
Below is a summary of what I checked.

.cmd files are primarily written by cmd_and_savecmd and cmd_and_fixdep.
This patch extends both writers to add make_prereqs_*.

The following rules append information to existing .cmd files.
None of these is affected by the new field:

- scripts/Makefile.lib: cmd_gen_objtooldep only appends new rule
  target: $(wildcard ./tools/objtool/objtool)
- scripts/Makefile.build: gen_symversions only appends comments
  #SYMVER <name> <crc>
- scripts/Makefile.lib: cmd_save_c_flags only appends a variable
  saved_c_flags_<target> :=3D <flags>
- rust/Makefile: cmd_gendwarfksyms only appends comments
  #SYMVER <name> <crc>
- kernel/Makefile: kheaders_data_dep appends a deps_* block
  deps_<target> :=3D <headers>.

This patch updates the following .cmd file consumers to account for the
new field:

- scripts/sbom/sbom/cmd_graph/cmd_file.py: CmdFile.create() parses
  savedcmd_<target>, source_<target>, and deps_<target>. It is updated
  to ignore make_prereqs_<target> for now. Parsing the new field will
  follow in a separate patch.
- scripts/make_fit.py: process_dtb() previously read and split the
  complete .cmd file to find the fdtoverlay command. It is changed to
  read only savedcmd_<target>.

The remaining consumers are not affected:

- Kbuild Makefiles: -include reads .cmd files as Makefile fragments. The
  new field is an ordinary variable assignment not used in any dependency
  rule.
- scripts/Makefile.thinlto: the saved_c_flags_* lookup only reads
  saved_c_flags_<target> :=3D <flags>.
- scripts/mod/modpost.c: extract_crcs_for_object() only reads comments
  #SYMVER <name> <crc>.
- scripts/mod/sumversion.c: parse_source_files() only reads
  source_<target> :=3D <source> and deps_<target> :=3D <dependencies>.
- scripts/clang-tools/gen_compile_commands.py: main() only reads the
  first line containing savedcmd_<target> :=3D <command>.
- scripts/generate_builtin_ranges.awk and
  scripts/verify_builtin_ranges.awk: get_module_info() only reads the
  first line and searches the saved command for DKBUILD_MODFILE or
  RUST_MODFILE.

Alternative: extending the deps_* field
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

An alternative to the new make_prereqs_* field is to merge $(real-prereqs=
)
into the existing deps_* field for both cmd_and_savecmd and cmd_and_fixde=
p.
This would avoid a new field and provide one dependency list. However, it
would broaden the meaning of deps_* from dependencies discovered through
generated .d files to include prerequisites already declared to Make.
This increases the risk of undesired side effects.

The writers listed above would need to ensure that each .cmd file
contains only one deps_* block. In particular, kheaders_data_dep would
need to merge its header dependencies into the block written by
cmd_and_savecmd instead of appending a second deps_* block.
cmd_and_fixdep, or fixdep.c depending on the implementation, would
likewise need to merge $(real-prereqs) with the generated dependencies.

Apart from KernelSbom, scripts/mod/sumversion.c is the only consumer
that explicitly reads deps_*. It uses selected dependency files to
calculate a module's srcversion. Extending deps_* could change this
module metadata. Such an unrelated change should probably be avoided.

Kbuild Makefiles also consume deps_* by including .cmd files. This
should not be an issue though, because $(real-prereqs) are already
present on the original target rule, so repeating them through deps_*
should not change rebuild behavior.

Luis Augenstein (1):
  kbuild: record real-prereqs in .cmd files

 scripts/Kbuild.include                  |  9 +++++++--
 scripts/basic/fixdep.c                  | 16 ++++++++++------
 scripts/make_fit.py                     |  2 +-
 scripts/sbom/sbom/cmd_graph/cmd_file.py |  4 ++++
 4 files changed, 22 insertions(+), 9 deletions(-)

--=20
2.43.0

