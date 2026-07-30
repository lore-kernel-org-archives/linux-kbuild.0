Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FF3FFAC6
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405126; cv=none; b=QQ3z2kFkUCRb9GHB5UDcUCDhZxKBuIp1CxVD9Z5tAUmU4TCh3TyPoSKlpY45sLjGppAmSX6865ToMmf1RSTRcn56WpVUE/TVI+axzP7w0WHGi/niRV4JrZrWSe8K+SPtkfYPsRUeWZV73sCk3t3QJ1by66tqXvBOBSw8NS1XdUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405126; c=relaxed/simple;
	bh=JE61UKkakCDGehXm3IAdZi0k36zhsctaoxdycgWPG6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=McmepSEJVTCGaEeSctHKmDTIJUFzwWrUELkgRKPkfzfvqX4STyLJcWe9SajeTMH+OsLilchNqCWjK+AmGshND9CCCJG3cDODc3H4YjUe8MKw/x8hp0KHdIPjsFziRyWXLoDAhN5itJsdWLEY6ryIxSrX1ozM4ujMIWQk1X1RYtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JvM2vutZ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JvM2vutZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785405111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DZDsjweuauVmZhAokVCQq1YjRfL3by63u4q7o7S1DyI=;
	b=JvM2vutZJeVf2ArnSgP6ly1CRl66R2sIJn/0aXHpCeNdyFUWCUc0HfLWIZS9Qzgr035q8A
	6kSUv5MDIEOv7L/poZ8Sg61rrcyE+EFjT2ax5pJaovVTSOV6S9r44t9jxRBi2aqICzeHyK
	K5wla8M4hejrMCo/omrcXPPMrDyXFsU=
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: David Laight <david.laight.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Hildenbrand <david@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	David Matlack <dmatlack@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joy H . J . Lee" <rkr0k0r@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Prepare mutable list iterators to cache cursor state
Date: Thu, 30 Jul 2026 17:50:32 +0800
Message-ID: <20260730095041.35715-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kaitao Cheng <chengkaitao@kylinos.cn>

The list_for_each*_safe() helpers are used when the loop body may remove
the current entry.  Their current interface, however, forces every caller
to define a temporary cursor outside the macro and pass it in, even when
the caller never uses that cursor directly.  For most call sites this
extra cursor is just boilerplate required by the macro implementation.

This is awkward because the saved next pointer is an internal detail of
the iteration.  Callers that only remove or move the current entry do not
need to spell it out.

The _safe() suffix has also caused confusion.  Christian Koenig pointed
out that the name is easy to read as a thread-safe variant, especially
for beginners, even though it only means that the iterator keeps enough
state to tolerate removal of the current entry.  He suggested _mutable()
as a clearer description of what the loop permits.

Add *_mutable() iterator variants for list, hlist and llist. The caller
omits the temporary cursor and the macro creates a unique internal cursor
with typeof(pos) and __UNIQUE_ID(). The existing *_safe() helpers remain
available for compatibility.

For ease of discussion, I need to summarize the currently possible
approaches and briefly describe their respective pros and cons,
using the list_for_each_entry* interfaces as examples.

1. Add list_for_each_entry_mutable, while keeping list_for_each_entry
and list_for_each_entry_safe unchanged. list_for_each_entry_mutable
would be used specifically for safe deletion scenarios that do not
need to expose the temporary cursor externally. The code can refer to
the v4 and v1 versions.

Pros: Does not depend on immediate per-subsystem adaptation and can be
      merged directly.
Cons: Requires adding a whole set of mutable interfaces, which makes the
      code somewhat redundant.

2. Directly optimize away the temporary cursor in list_for_each_entry_safe
and define it inside the loop instead, changing the interface from four
arguments to three.

Pros: Does not add redundant interfaces.
Cons: (1) Users need to manually update special cases that use the
      traversal variable of list_for_each_entry_safe, the new
      list_for_each_entry_safe would no longer apply there and would
      need to be open-coded.
      (2) Because the macro arguments changes, all list_for_each_entry_safe
      callers would need to be modified and merged together, making it
      difficult to merge such a large amount of code at once.

3. Use a variadic macro approach to optimize list_for_each_entry_safe,
so that it supports both three and four arguments. The code can refer to
the v3 version.

Pros: (1) Does not add redundant interfaces.
      (2) Does not depend on immediate per-subsystem adaptation and can
      be merged directly.
Cons: (1) Increases compile time.
      (2) Makes the interface harder for users to use.

4. Optimize list_for_each_entry by defining the temporary cursor
internally, making it compatible with the functionality of
list_for_each_entry_safe. The code can refer to the v2 version.

Pros: (1) Does not add redundant interfaces.
      (2) The number of externally visible arguments of list_for_each_entry
      remains unchanged, still three.
Cons: (1) list_for_each_entry and list_for_each_entry_safe would be merged
      into one, and list_for_each_entry_safe would gradually be deprecated.
      (2) Users need to manually update special cases that use the traversal
      variable of list_for_each_entry, the new list_for_each_entry would no
      longer apply there and would need to be open-coded. There are 15 such
      cases in total.

5. Use a variadic macro approach to optimize list_for_each_entry, so that
it supports both three and four arguments.

Pros: (1) Does not add redundant interfaces.
      (2) Does not depend on immediate per-subsystem adaptation and can be
      merged directly.
Cons: (1) Increases compile time.
      (2) list_for_each_entry and list_for_each_entry_safe would be merged
      into one, and list_for_each_entry_safe would gradually be deprecated.

6. Make no changes, keep the current logic unchanged, and close the current
email discussion.

After broad discussion, more developers agreed to use option 1 for the
change. The implementation details follow the current patch series.

Changes in v4 (Jani Nikula):
- Abandon variadic macro approach

Changes in v3 (Christian König, Andy Shevchenko):
- Convert safe list walks to mutable iterators

Changes in v2 (Muchun Song, Andy Shevchenko):
- Drop the list_for_each_entry_mutable*() helpers from v1 and make the
  cursor change directly in the existing list_for_each_entry*() helpers.
- Open-code special list walks that rely on updating the loop cursor in
  the body, preserving their existing traversal semantics.

Link to v3:
https://lore.kernel.org/all/20260622040533.29824-1-kaitao.cheng@linux.dev/

Link to v2:
https://lore.kernel.org/all/20260609061347.93688-1-kaitao.cheng@linux.dev/

Link to v1:
https://lore.kernel.org/all/20260529082149.76764-1-kaitao.cheng@linux.dev/

Kaitao Cheng (4):
  list: Add mutable iterator variants
  llist: Add mutable iterator variants
  tools/list: Add mutable iterator variants
  scripts/list: Add mutable iterator variants

 include/linux/list.h           | 180 +++++++++++++++++++++++++++++++-
 include/linux/llist.h          |  67 +++++++++++-
 scripts/include/list.h         |  56 +++++++++-
 tools/include/linux/compiler.h |   2 +
 tools/include/linux/list.h     | 184 +++++++++++++++++++++++++++++++--
 5 files changed, 472 insertions(+), 17 deletions(-)

-- 
2.43.0

